(defpackage strat
  (:use :common-lisp))

(in-package :strat)

(defun main ()
  (sdl:with-init nil
    (sdl:window 640 480 :bpp 8 :sw t)
    (sdl:set-caption "SDL Test!" "Sdl testing")
    (event-loop)))
    
(defun event-loop ()
  (sdl:with-events (:wait)
    (:quit-event () t)
    (:key-up-event () (sdl:push-quit-event))))
