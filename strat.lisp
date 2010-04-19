(defpackage strat
  (:use :common-lisp))

(in-package :strat)

(defun main ()
  (sdl:with-init nil
    (sdl:window 640 480 :bpp 8 :sw t :double-buffer t)
    (sdl:set-caption "SDL Test!" "Sdl testing") 
    (sdl:clear-display sdl:*blue*)
    (let ((tile (sdl:load-image "art/64x74_blue.png")))
      ;; (sdl:blit-surface tile))
      (sdl:draw-surface-at tile (sdl:point :x 30 :y 40)))
    (sdl:update-display)
    (event-loop)))
    
(defun event-loop ()
  (sdl:with-events (:wait)
    (:quit-event () t)
    (:key-up-event () (sdl:push-quit-event))))
