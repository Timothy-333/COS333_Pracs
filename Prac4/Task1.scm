#lang sicp
(define (stripNegativesDuplicateEvens numbers)
    (cond ((null? numbers) '())
                ((< (car numbers) 0) (stripNegativesDuplicateEvens (cdr numbers)))
                ((even? (car numbers)) (cons (car numbers) (cons (car numbers) (stripNegativesDuplicateEvens (cdr numbers)))))
                (else (cons (car numbers) (stripNegativesDuplicateEvens (cdr numbers))))))

(stripNegativesDuplicateEvens '())
(stripNegativesDuplicateEvens '(-1 -2 -3))
(stripNegativesDuplicateEvens '(1 2 -2 3 -3 4 5 -6))
