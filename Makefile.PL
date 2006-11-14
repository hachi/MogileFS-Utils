#!/usr/bin/perl

use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                        => 'MogileFS-Utils',
    VERSION                     => '1.50',
    AUTHOR                      => 'Brad Fitzpatrick <brad@danga.com>',
    ABSTRACT                    => 'MogileFS utilities',
    EXE_FILES                   => ['mogtool', 'mogadm'],
    PREREQ_PM                   => {
        'LWP::Simple' => 0,
        'Compress::Zlib' => 0,
    },
);

