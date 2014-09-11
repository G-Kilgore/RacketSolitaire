;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname solitaire-WIP) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "2htdp") (lib "universe.ss" "teachpack" "2htdp") (lib "batch-io.ss" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.ss" "teachpack" "2htdp") (lib "universe.ss" "teachpack" "2htdp") (lib "batch-io.ss" "teachpack" "2htdp")))))
(require racket/class)
(require games/cards)
(require racket/list)

;environment constants
(define MARGIN 10)
(define WIDTH 10)
(define HEIGHT 5)
(define PILE_X MARGIN)
(define PILE_Y MARGIN)
(define WASTE_X 100)
(define WASTE_Y MARGIN)
(define BUTTON_W 70)
(define BUTTON_H 30)

;WorldState
(define-struct WorldState (pile-cards waste-cards f1 f2 f3 f4 
                                      t1 t2 t3 t4 t5 t6 t7))



;set-pile-cards!
(define (callback-f1 loc)
  (cond[(stackable-t? (last-card (WorldState-f1 GAMESTATE)) (first loc))
        (begin  (remove-from-t loc GAMESTATE)
          (set-WorldState-f1! GAMESTATE (append loc (WorldState-f1 GAMESTATE)))
          (map (lambda (i) (send the-table move-card
                           (list-ref (WorldState-f1 GAMESTATE) i) 
                           602 12))
               (build-list (length (WorldState-f1 GAMESTATE)) identity))
          (send the-table stack-cards (WorldState-f1 GAMESTATE)))]))
(define (callback-f2 loc)
  (begin  (remove-from-t loc GAMESTATE)
          (set-WorldState-f2! GAMESTATE (append loc (WorldState-f2 GAMESTATE)))
          (map (lambda (i) (send the-table move-card
                           (list-ref (WorldState-f2 GAMESTATE) i)
                           502 12))
         (build-list (length (WorldState-f2 GAMESTATE)) identity))
          (send the-table stack-cards (WorldState-f2 GAMESTATE))))
(define (callback-f3 loc)
  (begin  (remove-from-t loc GAMESTATE)
          (set-WorldState-f3! GAMESTATE (append loc (WorldState-f3 GAMESTATE)))
          (map (lambda (i) (send the-table move-card
                           (list-ref (WorldState-f3 GAMESTATE) i)
                           402 12))
         (build-list (length (WorldState-f3 GAMESTATE)) identity))
          (send the-table stack-cards (WorldState-f3 GAMESTATE))))
(define (callback-f4 loc)
  (begin  (remove-from-t loc GAMESTATE)
          (set-WorldState-f4! GAMESTATE (append loc (WorldState-f4 GAMESTATE)))
          (map (lambda (i) (send the-table move-card
                           (list-ref (WorldState-f4 GAMESTATE) i)
                           302 12))
         (build-list (length (WorldState-f4 GAMESTATE)) identity))
          (send the-table stack-cards (WorldState-f4 GAMESTATE))))
(define (callback-t1 loc)
  (cond [(stackable-t? (first loc) (last-card (WorldState-t1 GAMESTATE)))
         (begin  (remove-from-t loc GAMESTATE)
          (set-WorldState-t1! GAMESTATE (append (WorldState-t1 GAMESTATE) loc))
          (map (lambda (i) (send the-table move-card
                           (list-ref (WorldState-t1 GAMESTATE) i)
                           27 (+ 212 (* 20 i))))
         (build-list (length (WorldState-t1 GAMESTATE)) identity)))]
        [else (set-WorldState-t1! GAMESTATE (WorldState-t1 GAMESTATE))]))
(define (callback-t2 loc)
  (cond [(stackable-t? (first loc) (last (WorldState-t2 GAMESTATE)))
         (begin  (remove-from-t loc GAMESTATE)
          (set-WorldState-t2! GAMESTATE (append (WorldState-t2 GAMESTATE) loc))
          (map (lambda (i) (send the-table move-card
                           (list-ref (WorldState-t2 GAMESTATE) i)
                           127 (+ 212 (* 20 i))))
         (build-list (length (WorldState-t2 GAMESTATE)) identity)))]
        [else (set-WorldState-t2! GAMESTATE (WorldState-t2 GAMESTATE))]))
(define (callback-t3 loc)
  (cond [(stackable-t? (first loc) (last (WorldState-t3 GAMESTATE)))
         (begin  (remove-from-t loc GAMESTATE)
          (set-WorldState-t3! GAMESTATE (append (WorldState-t3 GAMESTATE) loc))
          (map (lambda (i) (send the-table move-card
                           (list-ref (WorldState-t3 GAMESTATE) i)
                           227 (+ 212 (* 20 i))))
         (build-list (length (WorldState-t3 GAMESTATE)) identity)))]
        [else (set-WorldState-t3! GAMESTATE (WorldState-t3 GAMESTATE))]))
(define (callback-t4 loc)
  (begin  (remove-from-t loc GAMESTATE)
          (set-WorldState-t4! GAMESTATE (append (WorldState-t4 GAMESTATE) loc))
          (map (lambda (i) (send the-table move-card
                                 (list-ref (WorldState-t4 GAMESTATE) i)
                                 327 (+ 212 (* 20 i))))
               (build-list (length (WorldState-t4 GAMESTATE)) identity))))
(define (callback-t5 loc)
  (begin  (remove-from-t loc GAMESTATE)
          (set-WorldState-t5! GAMESTATE (append (WorldState-t5 GAMESTATE) loc))
          (map (lambda (i) (send the-table move-card
                                 (list-ref (WorldState-t5 GAMESTATE) i)
                                 427 (+ 212 (* 20 i))))
               (build-list (length (WorldState-t5 GAMESTATE)) identity))))
(define (callback-t6 loc)
  (begin  (remove-from-t loc GAMESTATE)
          (set-WorldState-t6! GAMESTATE (append (WorldState-t6 GAMESTATE) loc))
          (map (lambda (i) (send the-table move-card
                                 (list-ref (WorldState-t6 GAMESTATE) i)
                                 527 (+ 212 (* 20 i))))
               (build-list (length (WorldState-t6 GAMESTATE)) identity))))
(define (callback-t7 loc)
  (begin  (remove-from-t loc GAMESTATE)
          (set-WorldState-t7! GAMESTATE (append (WorldState-t7 GAMESTATE) loc))
          (map (lambda (i) (send the-table move-card
                                 (list-ref (WorldState-t7 GAMESTATE) i)
                                 627 (+ 212 (* 20 i))))
               (build-list (length (WorldState-t7 GAMESTATE)) identity))))


(define (remove-from-t loc ws)
  (local ((define c (first loc))) 
    (cond [(ormap (lambda (x) (card=? x c)) (WorldState-waste-cards ws)) 
           (set-WorldState-waste-cards! ws (remove c (WorldState-waste-cards ws)))]
          [(ormap (lambda (x) (card=? x c)) (WorldState-t1 ws)) 
           (set-WorldState-t1! ws (remove c (WorldState-t1 ws)))]
          [(ormap (lambda (x) (card=? x c)) (WorldState-t2 ws)) 
           (set-WorldState-t2! ws (remove c (WorldState-t2 ws)))]
          [(ormap (lambda (x) (card=? x c)) (WorldState-t3 ws)) 
           (set-WorldState-t3! ws (remove c (WorldState-t3 ws)))]
          [(ormap (lambda (x) (card=? x c)) (WorldState-t4 ws)) 
           (set-WorldState-t4! ws (remove c (WorldState-t4 ws)))]
          [(ormap (lambda (x) (card=? x c)) (WorldState-t5 ws)) 
           (set-WorldState-t5! ws (remove c (WorldState-t5 ws)))]
          [(ormap (lambda (x) (card=? x c)) (WorldState-t6 ws)) 
           (set-WorldState-t6! ws (remove c (WorldState-t6 ws)))]
          [(ormap (lambda (x) (card=? x c)) (WorldState-t7 ws)) 
           (set-WorldState-t7! ws (remove c (WorldState-t7 ws)))]
          [(ormap (lambda (x) (card=? x c)) (WorldState-f1 ws)) 
           (set-WorldState-f1! ws (remove c (WorldState-f1 ws)))]
          [(ormap (lambda (x) (card=? x c)) (WorldState-f2 ws)) 
           (set-WorldState-f2! ws (remove c (WorldState-f2 ws)))]
          [(ormap (lambda (x) (card=? x c)) (WorldState-f3 ws)) 
           (set-WorldState-f3! ws (remove c (WorldState-f3 ws)))]
          [(ormap (lambda (x) (card=? x c)) (WorldState-f4 ws)) 
           (set-WorldState-f4! ws (remove c (WorldState-f4 ws)))])))

(define (card=? c1 c2) 
  (and (= (send c1 get-value) (send c2 get-value)) 
              (symbol=? (send c1 get-suit) (send c2 get-suit))))

(define (red? card)
  (or (symbol=? (send card get-suit) 'hearts)
      (symbol=? (send card get-suit) 'diamonds)))

(define (black? card)
  (or (symbol=? (send card get-suit) 'spades)
      (symbol=? (send card get-suit) 'clubs)))


(define (diff-color? c1 c2)
  (or
   (and (red? c1) (black? c2))
   (and (black? c1) (red? c2))))


(define (one-more? c1 c2)
  (= (send c2 get-value) (add1 (send c1 get-value))))


;card card -> boolean
;determines whether cards can be stacked
(define (stackable-t? c1 c2)
  (cond [(and (empty? c1) (= (send c2 get-value) 13)) true]
        [(and (diff-color? c1 c2) (one-more? c1 c2))true]
        [else false]))

(define (last-card stack)
  (cond [(empty? stack) empty]
        [else (last stack)]))

;maybe should ask stackable of a stack, instead of a card? might fix
;issues with empty

;build the table and regions
(define the-table (make-table "Solitaire" WIDTH HEIGHT))

(define pile-region (make-region PILE_X PILE_Y 75 100 "Pile" false))
(define waste-region (make-region WASTE_X WASTE_Y 75 100 "Waste" false ))

(define f1 (make-region 600 10 75 100 "foundation1" callback-f1))
(define f2 (make-region 500 10 75 100 "foundation2" callback-f2 ))
(define f3 (make-region 400 10 75 100 "foundation3" callback-f3 ))
(define f4 (make-region 300 10 75 100 "foundation4" callback-f4 ))

(define t7 (make-region 625 210 75 100 "tableau7" callback-t7 ))
(define t6 (make-region 525 210 75 100 "tableau6" callback-t6 ))
(define t5 (make-region 425 210 75 100 "tableau5" callback-t5 ))
(define t4 (make-region 325 210 75 100 "tableau4" callback-t4 ))
(define t3 (make-region 225 210 75 100 "tableau3" callback-t3 ))
(define t2 (make-region 125 210 75 100 "tableau2" callback-t2 ))
(define t1 (make-region 25 210 75 100 "tableau1" callback-t1 ))

;Starting State
(define GAMESTATE (make-WorldState (shuffle-list (send the-table all-cards) 7)
                                   empty empty empty empty empty empty empty
                                   empty empty empty empty empty))


                   

;VOID->VOID
;moves all cards to proper positions, uses GAMESTATE
(define (render-cards)
  (begin
    (send the-table move-cards-to-region (WorldState-pile-cards GAMESTATE) pile-region)
    (map (lambda (x) (send x face-down)) (WorldState-pile-cards GAMESTATE))
    (send the-table stack-cards (WorldState-pile-cards GAMESTATE))
    ;moves waste cards to position
    (send the-table move-cards-to-region (WorldState-waste-cards GAMESTATE) waste-region)
    (send the-table stack-cards (WorldState-waste-cards GAMESTATE))
    ;moves tableau1 cards to position
    (map (lambda (i) (send the-table move-card 
                           (list-ref (WorldState-t1 GAMESTATE) i)
                           27 (+ 212 (* 20 i))))
         (build-list (length (WorldState-t1 GAMESTATE)) identity))
    ;moves t2 cards to position
    (map (lambda (i) (send the-table move-card 
                           (list-ref (WorldState-t2 GAMESTATE) i)
                           127 (+ 212 (* 20 i))))
         (build-list (length (WorldState-t2 GAMESTATE)) identity))
    ;moves t3 cards to position
    (map (lambda (i) (send the-table move-card 
                           (list-ref (WorldState-t3 GAMESTATE) i)
                           227 (+ 212 (* 20 i))))
         (build-list (length (WorldState-t3 GAMESTATE)) identity))
    ;moves t4 cards to postion
    (map (lambda (i) (send the-table move-card 
                           (list-ref (WorldState-t4 GAMESTATE) i)
                           327 (+ 212 (* 20 i))))
         (build-list (length (WorldState-t4 GAMESTATE)) identity))
    ;moves t5 cards to postion
    (map (lambda (i) (send the-table move-card 
                           (list-ref (WorldState-t5 GAMESTATE) i)
                           427 (+ 212 (* 20 i))))
         (build-list (length (WorldState-t5 GAMESTATE)) identity))
    ;moves t6 cards to postion
    (map (lambda (i) (send the-table move-card 
                           (list-ref (WorldState-t6 GAMESTATE) i)
                           527 (+ 212 (* 20 i))))
         (build-list (length (WorldState-t6 GAMESTATE)) identity))
    ;moves t7 cards to postion
    (map (lambda (i) (send the-table move-card 
                           (list-ref (WorldState-t7 GAMESTATE) i)
                           627 (+ 212 (* 20 i))))
         (build-list (length (WorldState-t7 GAMESTATE)) identity))
    ;sends f1 cards to position
    (send the-table move-cards-to-region (WorldState-f1 GAMESTATE) f1)
    (send the-table stack-cards (WorldState-f1 GAMESTATE))
    ;sends f2 cards to positon
    (send the-table move-cards-to-region (WorldState-f2 GAMESTATE) f2)
    (send the-table stack-cards (WorldState-f2 GAMESTATE))
    ;sends f3 cards to postion
    (send the-table move-cards-to-region (WorldState-f3 GAMESTATE) f3)
    (send the-table stack-cards (WorldState-f3 GAMESTATE))
    ;sends f4 cards to position
    (send the-table move-cards-to-region (WorldState-f4 GAMESTATE) f4)
    (send the-table stack-cards (WorldState-f4 GAMESTATE))
    ;finds face-down cards on top of tableaus and turns them over
    ))

;VOID->VOID
;moves all cards to the starting area
(define (play-new-game)
  (begin (set! GAMESTATE (make-WorldState (shuffle-list (send the-table all-cards) 7)
                                         empty empty empty empty empty empty empty
                                         empty empty empty empty empty))
  
  (render-cards)
  (for-each (lambda (c) 
              (send c snap-back-after-move true))
            (WorldState-pile-cards GAMESTATE))
  (deal-cards)
  (draw-one-card)))




;VOID->VOID
;deals cards into starting positions
(define (deal-cards)
  (begin
    (set! GAMESTATE (make-WorldState
                     (rest(rest (rest(rest (rest (rest (rest (rest(rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (rest (WorldState-pile-cards GAMESTATE))))))))))))))))))))))))))))))
                     (WorldState-waste-cards GAMESTATE)
                     (WorldState-f1 GAMESTATE)
                     (WorldState-f2 GAMESTATE)
                     (WorldState-f3 GAMESTATE)
                     (WorldState-f4 GAMESTATE)
                     (list (first (WorldState-pile-cards GAMESTATE)))
                     (reverse (list (list-ref (WorldState-pile-cards GAMESTATE) 2)
                           (list-ref (WorldState-pile-cards GAMESTATE) 8)))
                     (reverse (list (list-ref (WorldState-pile-cards GAMESTATE) 3)
                           (list-ref (WorldState-pile-cards GAMESTATE) 9)
                           (list-ref (WorldState-pile-cards GAMESTATE) 14)))
                     (reverse (list (list-ref (WorldState-pile-cards GAMESTATE) 4)
                           (list-ref (WorldState-pile-cards GAMESTATE) 10)
                           (list-ref (WorldState-pile-cards GAMESTATE) 15)
                           (list-ref (WorldState-pile-cards GAMESTATE) 19)))
                     (reverse (list (list-ref (WorldState-pile-cards GAMESTATE) 5)
                           (list-ref (WorldState-pile-cards GAMESTATE) 11)
                           (list-ref (WorldState-pile-cards GAMESTATE) 16)
                           (list-ref (WorldState-pile-cards GAMESTATE) 20)
                           (list-ref (WorldState-pile-cards GAMESTATE) 23)))
                     (reverse (list (list-ref (WorldState-pile-cards GAMESTATE) 6)
                           (list-ref (WorldState-pile-cards GAMESTATE) 12)
                           (list-ref (WorldState-pile-cards GAMESTATE) 17)
                           (list-ref (WorldState-pile-cards GAMESTATE) 21)
                           (list-ref (WorldState-pile-cards GAMESTATE) 24)
                           (list-ref (WorldState-pile-cards GAMESTATE) 26)))
                     (reverse (list (list-ref (WorldState-pile-cards GAMESTATE) 7)
                           (list-ref (WorldState-pile-cards GAMESTATE) 13)
                           (list-ref (WorldState-pile-cards GAMESTATE) 18)
                           (list-ref (WorldState-pile-cards GAMESTATE) 22)
                           (list-ref (WorldState-pile-cards GAMESTATE) 25)
                           (list-ref (WorldState-pile-cards GAMESTATE) 27)
                           (list-ref (WorldState-pile-cards GAMESTATE) 28)))))
    (render-cards)
    (flip-top (WorldState-t1 GAMESTATE))
    (flip-top (WorldState-t2 GAMESTATE))
    (flip-top (WorldState-t3 GAMESTATE))
    (flip-top (WorldState-t4 GAMESTATE))
    (flip-top (WorldState-t5 GAMESTATE))
    (flip-top (WorldState-t6 GAMESTATE))
    (flip-top (WorldState-t7 GAMESTATE))))

;VOID->VOID
;moves top card of the pile to waste
(define (draw-one-card)
  (begin
    (set-WorldState-waste-cards! GAMESTATE (append (list (first (WorldState-pile-cards GAMESTATE))) (WorldState-waste-cards GAMESTATE)))
    (set-WorldState-pile-cards! GAMESTATE (rest (WorldState-pile-cards GAMESTATE)))
    (send the-table cards-face-up (WorldState-waste-cards GAMESTATE))
    (render-cards)))



;Buttons
(define new-game-button (make-button-region 200 10 BUTTON_W BUTTON_H
                                            "New Game" play-new-game))
(define draw-one-card-button (make-button-region 200  80
                                                 BUTTON_W BUTTON_H "Draw" draw-one-card))

;VOID->VOID
;turns face-down cards on the top of a stack right-side-up
(define (flip-top stack)
  (cond [(empty? stack) empty]
        [(send (last stack) face-down?) (send the-table flip-card (last stack))]
        [else stack]))




;Set up the table
(send the-table add-region pile-region)
(send the-table add-region waste-region)
(send the-table add-region new-game-button)
(send the-table add-region draw-one-card-button)
(send the-table add-region f1)
(send the-table add-region f2)
(send the-table add-region f3)
(send the-table add-region f4)
(send the-table add-region t1)
(send the-table add-region t2)
(send the-table add-region t3)
(send the-table add-region t4)
(send the-table add-region t5)
(send the-table add-region t6)
(send the-table add-region t7)
(send the-table show true)
(send the-table add-cards-to-region (shuffle-list (make-deck) 7) waste-region)
(play-new-game)