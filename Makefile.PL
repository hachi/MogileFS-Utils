#!/usr/bin/perl

use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                        => 'MogileFS-Utils',
    VERSION_FROM                => 'lib/MogileFS/Utils.pm',
    AUTHOR                      => 'Brad Fitzpatrick <brad@danga.com>',
    ABSTRACT                    => 'MogileFS utilities',
    EXE_FILES                   => ['mogtool', 'mogadm'],
    PREREQ_PM                   => {
        'LWP::Simple'      => 0,
        'Compress::Zlib'   => 0,
        'MogileFS::Client' => '1.08',
    },
);
