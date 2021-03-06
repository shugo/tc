;;; tc-pre.el --- preliminary part for T-Code package -*-emacs-lisp-*-

;; Copyright (C) 2002 KITAJIMA Akira.

;; Author: KITAJIMA Akira <kitajima@isc.osakac.ac.jp>
;; Created: 16 Aug 2002
;; Version: $Id: tc-pre-base.in,v 2.2 2002/11/12 09:40:38 kitajima Exp $

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA.

;;; Code:

(defconst tcode-emacs-version
  (cond ((string-match "XEmacs" emacs-version)
	 'xemacs)
	((and (boundp 'mule-version)
	      (>= (string-to-int mule-version) 4))
	 'mule-4)
	((and (boundp 'mule-version)
	      (= (string-to-int mule-version) 3))
	 'mule-3)
	((numberp (string-match "^19" emacs-version))
	 'mule-2)
	((featurep 'mule)
	 'mule-1)
	(t
	 (or (boundp 'emacs-major-version)
	     (setq emacs-major-version 18))
	 'nemacs))
  "$BF|K\8l(BEmacs$B$N%?%$%W!#(B
nemacs, mule-1, mule-2, mule-3, mule-4, xemacs$B$N$$$:$l$+!#(B")

(defconst tcode-isearch-type 
  (cond ((eq tcode-emacs-version 'nemacs)
	 'tc-is18)
	((memq tcode-emacs-version '(mule-1 mule-2 mule-3 xemacs))
	 'tc-is19)
	((numberp (string-match "^22" emacs-version))
	 'tc-is22)
	(t
	 'tc-is20))
  "isearch$B$GMQ$$$k(BT$B%3!<%IMQ%b%8%e!<%k$N%?%$%W!#(B")

(defmacro tcode-xemacs-p ()
  (list 'eq 'tcode-emacs-version (list 'quote 'xemacs)))

(defmacro tcode-mule-4-p ()
  (list 'eq 'tcode-emacs-version (list 'quote 'mule-4)))

(defmacro tcode-mule-3-p ()
  (list 'eq 'tcode-emacs-version (list 'quote 'mule-3)))

(defmacro tcode-mule-2-p ()
  (list 'eq 'tcode-emacs-version (list 'quote 'mule-2)))

(defmacro tcode-mule-1-p ()
  (list 'eq 'tcode-emacs-version (list 'quote 'mule-1)))

(defmacro tcode-nemacs-p ()
  (list 'eq 'tcode-emacs-version (list 'quote 'nemacs)))

(defvar tcode-load-immediate nil
  "nil $B$G$J$$$H$-!"(BT$B%3!<%IMQ$N$9$Y$F$N%b%8%e!<%k$r0lEY$K%m!<%I$9$k!#(B")

(defvar tcode-init-file-name "~/.tc"
  "tc-setup.el $B$rFI$_=P$9$H$-$KFI$^$l$k8D?MMQ@_Dj%U%!%$%k$NL>A0!#(B
$B%U%!%$%kL>$rJQ99$7$?$$>l9g$O(B tc-setup.el $B$rFI$_=P$9A0$K$3$NCM$r(B
$B@_Dj$7$J$1$l$P$J$i$J$$!#(B")

(defvar tcode-use-isearch nil
  "nil $B$G$J$$$H$-!"(BT$B%3!<%I$r;HMQ$G$-$k$h$&$K(Bisearch$B$r3HD%$9$k!#(B")

(defvar tcode-use-as-default-input-method nil
  "nil $B$G$J$$$H$-!"(BT$B%3!<%I$r%G%U%)!<%k%H$N(Binput method$B$K$9$k!#(B")

(defvar tcode-default-input-method "japanese-T-Code"
  "T$B%3!<%IF~NO4D6-$G$N%G%U%)!<%k%H$N(Binput method$B!#(B
$BJQ?t(B`tcode-package-name-alist'$B$KEPO?$5$l$F$$$kL>A0$,;XDj$G$-$k!#(B")

(defvar tcode-data-directory nil
  "T$B%3!<%I$N3F<o%G!<%?%U%!%$%k$rCV$/$?$a$N%G%#%l%/%H%j!#(B
$BKvHx$K(B\"/\"$B$rIU$1$J$1$l$P$J$i$J$$!#(B")

;;;; Version

(defconst tcode-version "3.0")

(defun tcode-version ()
  "T$B%3!<%IF~NO4D6-$N%P!<%8%g%s$rI=<($9$k!#(B"
  (interactive)
  (if (interactive-p)
      (message (concat "T-Code input environment version "
		       (tcode-version)
		       (if (tcode-xemacs-p)
			   " on XEmacs "
			 " on Emacs ")
		       emacs-version
		       (if (boundp 'nemacs-version)
			   (concat "/NEmacs " nemacs-version))
		       (if (boundp 'mule-version)
			   (concat "/Mule " mule-version))))
    tcode-version))

;;;; package
(defvar tcode-package-name-alist
  '(("japanese-T-Code" . "tc-tbl")
    ("japanese-TT-Code" . "ttc-tbl")
    ("japanese-Try-Code" . "try-tbl")
    ("japanese-TUT-Code" . "tutc-tbl"))
  "$BL>A0$H%F!<%V%kL>$H$NBP1~(B")

;;;; site information


(defconst tcode-site-data-directory "/usr/local/share/tc/")

(provide 'tc-pre)

;;; tc-pre.el ends here
