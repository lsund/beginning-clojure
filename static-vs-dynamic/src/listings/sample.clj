
;; start snippet vars

;; I can do this
(< 5 x 10)

;; Instead of this
(and (> x 5) (< x 10))

;; end snippet vars

;; start snippet hiccup

(defn square
  [value on-click]
  [:button.square
   {:on-click on-click}
   value])

;; end snippet hiccup
