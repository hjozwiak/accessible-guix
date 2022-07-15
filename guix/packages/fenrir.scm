(define-module (nongnu packages fenrir)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix licenses))
(define-public fenrir
  (package
   (name "fenrir")
   (version "1.9.7")
   (source (origin
            (method git-refetch)
            (url (git-reference
                  (url "https://github.com/chrys87/fenrir")
                  (commit version)))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0xr2aq2ndvpp95r1wi8bcbn74xj9cd22ri5d0z4gm71y25dm2v25"))))
   (build-system python-build-system)
   (inputs '(sox espeak-ng python-daemonize python-pyudev python-dbus python-pyte python-pyudev))
   (license lgpl3+)
   (description
    "Fenrir is a moder TTY screenreader written in Python 3. It supports espeak, brltty for Braille output, and sound icons")
   (home-page "https://linux-a11y.org/index.php?page=fenrir-screenreader")
   (synopsis "A modern TTY screenreader for Linux")))
