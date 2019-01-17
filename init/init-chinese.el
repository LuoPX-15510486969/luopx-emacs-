
(setq inhibit-compacting-font-caches t)

(when (eq system-type 'windows-nt) 
    (setq gc-cons-threshold (* 512 1024 1024)))

 (setq gc-cons-percentage 0.5)
 (run-with-idle-timer 5 t #'garbage-collect) 

;; 显示垃圾回收信息，这个可以作为调试用 ;;
;; (setq garbage-collection-messages t) 



(provide 'init-chinese)
