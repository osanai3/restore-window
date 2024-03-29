;;; restore-window.el --- restore killed window -*- lexical-binding: t; -*-

;; Copyright (C) 2014 by Koichi Osanai

;; Author: Koichi Osanai <osanai3@gmail.com>
;; Version: 0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; (require 'restore-window)
;; (global-set-key (kbd "C-x 1") 'restore-window-delete-other-windows-or-restore-window)

;;; Code:

(defun restore-window-delete-other-windows ()
  (interactive)
  (modify-frame-parameters nil (list (cons 'restore-window-register (current-window-configuration))))
  (delete-other-windows))

(defun restore-window-restore-window ()
  (interactive)
  (let ((configuration (cdr (assoc 'restore-window-register (frame-parameters)))))
    (when configuration (set-window-configuration configuration))))

(defun restore-window-delete-other-windows-or-restore-window ()
  (interactive)
  (if (window-parent)
      (restore-window-delete-other-windows)
    (restore-window-restore-window)))

(provide 'restore-window)

;;; restore-window.el ends here
