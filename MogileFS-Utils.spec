name:      MogileFS-Utils
summary:   MogileFS-Utils - MogileFS utilities.
version:   2.14
release:   1%{?dist}
vendor:    Alan Kasindorf <dormando@rydia.net>
packager:  Jonathan Steinert <rpm@hachi.kuiki.net>
license:   Artistic
group:     Applications/CPAN
buildroot: %{_tmppath}/%{name}-%{version}-%(id -u -n)
buildarch: noarch
source:    MogileFS-Utils-%{version}.tar.gz
autoreq:   no
requires:  perl
requires:  perl(MogileFS::Client) >= 1.08
requires:  perl(Compress::Zlib)

%description
MogileFS  utilities.

%prep
rm -rf "%{buildroot}"
%setup -n MogileFS-Utils-%{version}

%build
%{__perl} Makefile.PL PREFIX=%{buildroot}%{_prefix}
make all
make test

%install
make pure_install

[ -x /usr/lib/rpm/brp-compress ] && /usr/lib/rpm/brp-compress

# remove special files
find %{buildroot} \(                    \
       -name "perllocal.pod"            \
    -o -name ".packlist"                \
    -o -name "*.bs"                     \
    \) -exec rm -f {} \;

# no empty directories
find %{buildroot}%{_prefix}             \
    -type d -depth -empty               \
    -exec rmdir {} \;

%clean
[ "%{buildroot}" != "/" ] && rm -rf %{buildroot}

%files
%defattr(-,root,root)
%{_prefix}/bin/*
%{_prefix}/share/man/man1/*
%{_prefix}/share/man/man3/*
%{_prefix}/lib/perl5/site_perl/*

