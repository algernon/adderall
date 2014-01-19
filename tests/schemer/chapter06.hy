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
        [tests.schemer.common [*]])
(require adderall.dsl)
(require tests.schemer.common)

(frame "6.6" []
       (run 1 [q]
            #uu
            neverᵒ))

(frame "6.7" [true]
       (run 1 [q]
            alwaysᵒ
            (≡ true q)))

(frame "6.10" [true true true true true]
       (run 5 [q]
            alwaysᵒ
            (≡ true q)))

(frame "6.11" [true true true true true]
       (run 5 [q]
            (≡ true q)
            alwaysᵒ))

(frame "6.13" [true]
       (run 1 [q]
            (salᵒ alwaysᵒ)
            (≡ true q)))

(frame "6.14" [true]
       (run 1 [q]
            (salᵒ neverᵒ)
            (≡ true q)))