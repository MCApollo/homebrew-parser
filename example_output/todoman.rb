name :
	 Todoman
homepage :
	 https://todoman.readthedocs.io/
url :
	 https://files.pythonhosted.org/packages/bb/49/25511ca1f2762eda6cd95ccf1bd62c9ca5009469445b9263064a5ffbff78/todoman-3.4.0.tar.gz
description :
	 Simple CalDAV-based todo manager
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
	 devtodo
resource :
	 ['atomicwrites', 'click', 'click-log', 'configobj', 'future', 'humanize', 'icalendar', 'parsedatetime', 'python-dateutil', 'pytz', 'pyxdg', 'six', 'tabulate', 'urwid']
	 ['https://files.pythonhosted.org/packages/a1/e1/2d9bc76838e6e6667fde5814aa25d7feb93d6fa471bf6816daac2596e8b2/atomicwrites-1.1.5.tar.gz', 'https://files.pythonhosted.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz', 'https://files.pythonhosted.org/packages/31/b7/95ad377ec87570d2e80f90e8ffe574a3d907a97c2b6613a17b6f81e0dda5/click-log-0.2.1.tar.gz', 'https://files.pythonhosted.org/packages/64/61/079eb60459c44929e684fa7d9e2fdca403f67d64dd9dbac27296be2e0fab/configobj-5.0.6.tar.gz', 'https://files.pythonhosted.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz', 'https://files.pythonhosted.org/packages/8c/e0/e512e4ac6d091fc990bbe13f9e0378f34cf6eecd1c6c268c9e598dcf5bb9/humanize-0.5.1.tar.gz', 'https://files.pythonhosted.org/packages/aa/58/d9fb6d9dc8919e32c175a56a25a296c7ca9d5f4075e52647126d40dcf6c6/icalendar-4.0.1.tar.gz', 'https://files.pythonhosted.org/packages/e3/b3/02385db13f1f25f04ad7895f35e9fe3960a4b9d53112775a6f7d63f264b6/parsedatetime-2.4.tar.gz', 'https://files.pythonhosted.org/packages/a0/b0/a4e3241d2dee665fea11baec21389aec6886655cd4db7647ddf96c3fad15/python-dateutil-2.7.3.tar.gz', 'https://files.pythonhosted.org/packages/10/76/52efda4ef98e7544321fd8d5d512e11739c1df18b0649551aeccfb1c8376/pytz-2018.4.tar.gz', 'https://files.pythonhosted.org/packages/47/6e/311d5f22e2b76381719b5d0c6e9dc39cd33999adae67db71d7279a6d70f4/pyxdg-0.26.tar.gz', 'https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz', 'https://files.pythonhosted.org/packages/12/c2/11d6845db5edf1295bc08b2f488cf5937806586afe42936c3f34c097ebdc/tabulate-0.8.2.tar.gz', 'https://files.pythonhosted.org/packages/c7/90/415728875c230fafd13d118512bde3184d810d7bf798a631abc05fac09d0/urwid-2.0.1.tar.gz']
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
