#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <utime.h>

#ifndef DEFFILEMODE
#define DEFFILEMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)
#endif

MODULE = Touch		PACKAGE = Touch		

int
touch(file)
SV *file;

    INIT:
        struct stat statbuf;
        struct utimbuf ubuf;
        int fd;
        time_t now;
    CODE:
        RETVAL = 1;
        if(stat(SvPVX_const(file), &statbuf) == 0 ) {
            now = time(NULL);
            ubuf.actime = now;
            ubuf.modtime = now;
            if(utime(SvPVX_const(file), &ubuf) != 0) {
                warn("Could not touch %s:  %s", SvPVX_const(file), Strerror(errno));
                XSRETURN_UNDEF;
            }
        } else {
            fd = open(SvPVX_const(file), O_CREAT|O_WRONLY, DEFFILEMODE);
            if(fd == -1 || close(fd)) {
               warn("Could not touch %s:  %s", SvPVX_const(file), Strerror(errno));
               XSRETURN_UNDEF;
            }
        }

    OUTPUT:
    RETVAL
