(defpackage strat
  (:use :common-lisp :sdl))

(in-package :strat)

(defun main ()
  (init *init-everything*)
  (set-video-mode 640 480 8 *swsurface*)
  (set-caption "SDL test!" "Sdl testiranaje")
  (event-loop)
  (quit))

(defun event-loop ()
  (sleep 3))
