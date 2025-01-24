;; Title: BitFutures - Decentralized Bitcoin Price Prediction Market
;; 
;; Summary:
;;   A decentralized prediction market platform for Bitcoin price movements,
;;   allowing users to stake STX tokens on future BTC price directions.
;;
;; Description:
;;   BitFutures enables users to participate in prediction markets for Bitcoin price movements.
;;   Users can stake STX tokens on whether they believe the BTC price will go up or down within
;;   a specified timeframe. Winners share the total pool proportionally to their stake, minus
;;   a small platform fee. The system uses an oracle for price resolution and includes
;;   safeguards for market integrity and user fund protection.
;;
;; Features:
;;   - Binary markets (up/down predictions)
;;   - Proportional reward distribution
;;   - Oracle-based price resolution
;;   - Configurable minimum stakes and fees
;;   - Automated market lifecycle management

;; Traits

;; Token Definitions

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-invalid-prediction (err u102))
(define-constant err-market-closed (err u103))
(define-constant err-already-claimed (err u104))
(define-constant err-insufficient-balance (err u105))
(define-constant err-invalid-parameter (err u106))

;; Data Variables
(define-data-var oracle-address principal 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-data-var minimum-stake uint u1000000) ;; 1 STX minimum
(define-data-var fee-percentage uint u2) ;; 2% platform fee
(define-data-var market-counter uint u0)