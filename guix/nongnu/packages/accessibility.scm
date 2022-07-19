(define-module (nongnu packages accessibility)
  #:use-module (guix packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages admin)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system meson)
  #:use-module (guix licenses))
(define-public espeakup
  (package
    (name "espeakup")
    (version "0.90")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/linux-speakup/espeakup")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
                            (sha256
               (base32
                "0lmjwafvfxy07zn18v3dzjwwpnid2xffgvy2dzlwkbns8gb60ds2"))))
    (build-system meson-build-system)
    (native-inputs (list pkg-config))
    (inputs (list espeak-ng alsa-lib))
    (license gpl3+)
    (synopsis "A bridge for espeak and speakup")
    (description
     "Ditto")
    (home-page "https://github.com/williamh/espeakup")))
