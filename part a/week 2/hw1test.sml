use "hw1.sml";

(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)


val test1a = is_older ((1,1,1),(1,1,1)) = false
val test1b = is_older ((1,1,1),(2,2,2)) = true
val test1c = is_older ((2,2,2),(1,1,1)) = false
val test1d = is_older ((1,1,1),(1,1,2)) = true
val test1e = is_older ((1,1,2),(1,1,1)) = false
val test1f = is_older ((1,2,2),(1,1,2)) = false
val test1g = is_older ((1,1,2),(1,2,2)) = true
val test1h = is_older ((1,2,2),(2,2,2)) = true
val test1i = is_older ((2,2,2),(1,2,2)) = false

val test2a = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test2b = number_in_month ([], 2) = 0
val test2c = number_in_month ([(2012,2,28),(2012,12,1)],4) = 0
val test2d = number_in_month ([(2022,5,2),(2016,6,28),(2019,6,1)], 6) = 2

val test3a = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3b = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
val test3c = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2]) = 1
val test3d = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[6]) = 0

val test4a = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4b = dates_in_month ([(2012,2,28),(2013,12,1)],3) = []
val test4c = dates_in_month ([(2012,2,28),(2013,12,1),(2022,2,1)],2) = [(2012,2,28),(2022,2,1)]

val test5a = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test5b = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []
val test5c = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[6,7]) = []

val test6a = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test6b = get_nth (["hi", "there", "how", "are", "you"], 5) = "you"
val test6c = get_nth (["hi", "there", "how", "are", "you"], 1) = "hi"

val test7a = date_to_string (2013, 6, 1) = "June 1, 2013"
val test7b = date_to_string (2022, 12, 28) = "December 28, 2022"
val test7c = date_to_string (2007, 1, 16) = "January 16, 2007"

val test8a = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test8b = number_before_reaching_sum (1, [1,2,3,4,5]) = 0
val test8c = number_before_reaching_sum (11, [1,2,3,4,5]) = 4

val test9a = what_month 70 = 3
val test9b = what_month 365 = 12
val test9c = what_month 1 = 1

val test10 = month_range (31, 34) = [1,2,2,2]

val test11a = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test11b = oldest([]) = NONE
val test11c = oldest([(2012,2,28),(2011,3,31),(2011,1,28)]) = SOME (2011,1,28)
val test11d = oldest([(2010,2,28),(2011,3,31),(2011,4,28)]) = SOME (2010,2,28)
