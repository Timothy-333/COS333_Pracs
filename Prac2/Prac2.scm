#lang sicp
(define (circleArea r)
  (let ((pi (/ 22 7)))
    (if (or (zero? r) (negative? r))
        0
        (* pi r r))))
(define (countDivisors num divisors)
  (if (not(list? divisors))
      (display "Not a List")
      (if (null? divisors)
          0
          (if(zero? (remainder num (car divisors)))
            (+ 1 (countDivisors num (cdr divisors)))
            (countDivisors num (cdr divisors))))))

(define (getEveryEvenElement numbers)
    (if (not (list? numbers))
            (display "Not a List")
            (let ((result (addToList numbers 1 '())))
                (reverseList result '()))))

(define (addToList numbers count listOfEvens)
    (if (null? numbers)
            listOfEvens
            (let ((newListOfEvens (if (even? count) (cons (car numbers) listOfEvens) listOfEvens)))
                (addToList (cdr numbers) (+ 1 count) newListOfEvens))))

(define (reverseList input output)
    (if (null? input)
            output
            (reverseList (cdr input) (cons (car input) output))))