(defpackage sdl
  (:use :common-lisp :ffi)
  (:export :*init-everything*
           :*init-video*
           :*swsurface*
           :init
           :set-video-mode
           :set-caption
           :quit
   ))

(in-package :sdl)

(load-foreign-library "SDL" :system-library t)

(def-foreign-type UINT8 :unsigned-byte)
(def-foreign-type UINT32 :unsigned-long)

(defmacro def-sdl-const (name value &optional (c-type :int))
  (declare (ignore c-type))
  `(defconstant ,name ,value))

(def-sdl-const *init-everything*    #x0000FFFF)
(def-sdl-const *init-video*         #x00000020)
(def-sdl-const *swsurface*          #x00000000) ; Surface is in system memory


(defmacro def-sdl-function (name args &key (returning :void) module)
  `(def-function ,name ,args :returning ,returning :module ,module))
(eval-when (:compile-toplevel)
  (define-compiler-macro def-sdl-function (name args &key (returning :void) module)
    `(def-function ,name ,args :returning ,returning :module ,module)))


(def-sdl-function ("SDL_Init" init) ((init-flags UINT32))
  :returning :int)

(def-sdl-function ("SDL_SetVideoMode" set-video-mode) ((width :int) (height :int) (depth :int) (flags :unsigned-int))
  :returning :pointer-void)

(def-sdl-function ("SDL_WM_SetCaption" set-caption) ((title :cstring) (icon :cstring)))

(def-sdl-function ("SDL_Quit" quit) ())
