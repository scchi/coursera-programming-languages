fun is_older (d1 : int * int * int, d2 : int * int * int) =
    (#1 d1 < #1 d2) orelse
    ((#1 d1 = #1 d2) andalso (#2 d1 < #2 d2)) orelse
    ((#1 d1 = #1 d2) andalso (#2 d1 = #2 d2) andalso (#3 d1 < #3 d2))

fun number_in_month (datesList : (int * int * int) list, month : int) =
    if null datesList
    then 0
    else
	if #2 (hd datesList) = month
	then 1 + number_in_month(tl datesList, month)
	else 0 + number_in_month(tl datesList, month)

fun number_in_months(datesList : (int * int * int) list, months : int list) =
    if null months
    then 0
    else number_in_month(datesList, hd months) + number_in_months(datesList, tl months)
		
fun dates_in_month (datesList : (int * int * int) list, month : int) =
    if null datesList
    then []
    else
	if #2 (hd datesList) = month
	then [hd datesList]@dates_in_month(tl datesList, month)
	else []@dates_in_month(tl datesList, month)
	    
fun dates_in_months (datesList : (int * int * int) list, months : int list) =
    if null months
    then []
    else dates_in_month(datesList, hd months)@dates_in_months(datesList, tl months)
							 
fun get_nth (stringList : string list, n : int) =
    if n = 1
    then hd stringList
    else get_nth(tl stringList, n - 1)

fun date_to_string (date : int * int * int) =
    let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	val month_string = get_nth(months, #2 date)
	val year_string = Int.toString(#1 date)
	val day_string = Int.toString(#3 date)
    in
	month_string ^ " " ^ day_string ^ ", " ^ year_string
    end
	
fun number_before_reaching_sum (sum : int, num_list : int list) =
    let
	val current_num = hd num_list
	val current_sum = sum - current_num
    in
	if current_sum <= 0
	then 0
	else 1 + number_before_reaching_sum (current_sum, tl num_list)
    end
	
fun what_month (day : int) =
    let val month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	number_before_reaching_sum (day, month_days) + 1
    end

fun month_range (day1 : int, day2 : int) =
    if day1 > day2
    then []
    else
	let val month_of_current_day = what_month(day1)
	    val next_day = day1 + 1								
	in
	    month_of_current_day::month_range(next_day, day2)
	end
	    
fun oldest (dates_list : (int * int * int) list) =
    if null dates_list
    then NONE
    else
	let
	    fun oldest_nonempty(dates_list : (int * int * int) list) =
		if null (tl dates_list)
		then hd dates_list
		else let val tl_ans = oldest_nonempty(tl dates_list)
			 val current_date = hd dates_list
		     in
			 if is_older(current_date, tl_ans)
			 then current_date
			 else tl_ans
		     end
	in
	    SOME (oldest_nonempty (dates_list))
	end
	    
	    
	    
