use 5.008008;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Touch',
    VERSION_FROM      => 'lib/Touch.pm', 
    PREREQ_PM         => {},
    ($] >= 5.005 ?     
      (ABSTRACT_FROM  => 'lib/Touch.pm', 
       AUTHOR         => 'Steve Peters <steve at fisharerojo.org>') : ()),
    LIBS              => [''], 
    DEFINE            => '', 
    INC               => '-I.', 
);
