;; adderall - miniKanren in Hy
;; Copyright (C) 2014  Gergely Nagy <algernon@madhouse-project.org>
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(import [adderall.dsl [*]]
        [hy.models.symbol [HySymbol]])
(require adderall.dsl)

(defn unbound [n]
  (LVar (.format "_.{0}" n)))

(defmacro frame [frame-num value expr]
  (let [[res (gensym)]
        [name (+ 'test-rs- frame-num)]]
    `(defn ~(HySymbol name) []
       (let [[q (fresh [q])]
             [~res ~expr]]
         (assert (= ~value ~res))))))