(define-module (nongnu system installer)
  #:use-module (guix  channels)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu system)
  #:use-module (gnu system install)
  #:use-module (gnu services ssh)
  #:use-module (gnu packages linux)
  #:use-module (nongnu packages linux)
  #:use-module (nongnu packages accessibility))
(define original-services (operating-system-user-services installation-os))
(define our-services (modify-services original-services
                       (openssh-service-type config =>
                                             (openssh-configuration
                                              (inherit config)
                                              (%auto-start? #t)
                                              (permit-root-login #t)
                                              (allow-empty-passwords? #t)))))
(define-public accessible-installer
  (operating-system
    (inherit installation-os)
    (kernel linux)
    (firmware (list linux-firmware))
    (kernel-arguments '("quiet" "modprobe.blacklist=radeon" "net.ifnammes=0"))
    (packages (append (list espeakup alsa-utils) (operating-system-packages installation-os)))
    (services (cons*
               (simple-service 'channel-file etc-service-type
                               (list `("channels.scmm" ,(local-file "../../channels.scm"))))
               our-services))))
accessible-installer
