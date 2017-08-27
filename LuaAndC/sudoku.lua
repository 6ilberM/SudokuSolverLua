local Sudoku = {}
for Rows=1,9 do
Sudoku[Rows] = {}
	for Columns=1,9 do
	Sudoku[Rows][Columns] = 0

	end
end
--
local UNNASINGED = '0'

function SetLine(Line,Number)
times=1
	for word in string.gmatch(Line, '([^, ]+)') do
	Sudoku[Number][times]=word
	--(Sudoku[Number][times])

	times=times+1
	end
times=1
end
function Display()
for	i=1,9 do
		for	j=1,9 do

print(Sudoku[i][j])
		end
print(" ")
	end
end

function DisplayPara(Param1,Param2)
for	i=1,Param1 do
		for	j=1,Param2 do

print(Sudoku[i][j])
		end
	end
print(" ")
end


--
--Values And their input method

--BAseCase
--~ --				Box1    Box2	   Box3
--~ local Line1 ="8, 0, 0, 4, 0, 6, 0, 0, 7"
--~ local Line2 ="0, 0, 0, 0, 0, 0, 4, 0, 0"
--~ local Line3 ="0, 1, 0, 0, 0, 0, 6, 5, 0"

--~ --				Box4    Box5	   Box6
--~ local Line4 ="5, 0, 9, 0, 3, 0, 7, 8, 0"
--~ local Line5 ="0, 0, 0, 0, 7, 0, 0, 0, 0"
--~ local Line6 ="0, 4, 8, 0, 2, 0, 1, 0, 3"

--~ --				Box7    Box8	   Box9
--~ local Line7 ="0, 5, 2, 0, 0, 0, 0, 9, 0"
--~ local Line8 ="0, 0, 1, 0, 0, 0, 0, 0, 0"
--~ local Line9 ="3, 0, 0, 9, 0, 2, 0, 0, 5"

--				Box1    Box2	   Box3
local Line1 ="8, 3, 5, 4, 1, 6, 9, 2, 7"
local Line2 ="2, 9, 6, 8, 5, 7, 4, 3, 1"
local Line3 ="4, 1, 7, 2, 9, 3, 6, 5, 8"

--				Box4    Box5	   Box6
local Line4 ="5, 6, 9, 1, 3, 4, 7, 8, 2"
local Line5 ="1, 2, 3, 6, 7, 8, 5, 4, 9"
local Line6 ="7, 4, 8, 5, 2, 9, 1, 0, 3"

--				Box7    Box8	   Box9
local Line7 ="0, 5, 2, 0, 0, 0, 0, 9, 0"
local Line8 ="0, 0, 1, 0, 0, 0, 0, 0, 0"
local Line9 ="3, 0, 0, 9, 0, 2, 0, 0, 5"


--Function that sets the values in the Tables"Array"

function SetSudoku()

SetLine(Line1,1)
--print(" ")
SetLine(Line2,2)
--print(" ")
SetLine(Line3,3)
--print(" ")
SetLine(Line4,4)
--print(" ")
SetLine(Line5,5)
--print(" ")
SetLine(Line6,6)
--print(" ")
SetLine(Line7,7)
--print(" ")
SetLine(Line8,8)
--print(" ")
SetLine(Line9,9)

end


SetSudoku()

local ROW
local COLL
local NUM

--FindUnassingedLoc WORKS
function FindUnassingedLoc(Array2D)
	for	i=1,9 do
		for	j=1,9 do
 		ROW=i COLL=j
			if (Array2D[i][j]=='0') then return true

			end
		end
	end
	return false
end

--UsedInRow WORKS!
function UsedInRow(Array2D,ROW,NUM)
	for coll= 1,9 do
--~ 			print(ROW,coll,NUM)
		if(Array2D[ROW][coll]==NUM) then return true

		end
	end
	return false
end
--UsedInCol

function UsedInCol(Array2D,COLL,NUM)
	for row= 1,9 do
		if(Array2D[row][COLL]==NUM) then return true
		end
	end
return false
end

--UsedInBox

function UsedInBox(Array2D,NUM,ROW,COLL)
	for i=1,3+(ROW-ROW%3) do
		for	j=1,3+(COLL-COLL%3) do

			if (Sudoku[i][j] == NUM) then return true

			end
		end
	end
	return false
end

--NoConflicts AS soon as any is false it will throw False WORKS
function NoConflicts(Sudoku,ROW,COLL,NUM)


--~ return ((UsedInRow(Sudoku, ROW, NUM)==false) and (UsedInBox(Array2D,NUM,ROW,COLL)==false)) --and (UsedInCol(Sudoku, COLL, NUM)==false) )
return ((UsedInCol(Sudoku, COLL, NUM)==false)) and (UsedInRow(Sudoku, ROW, NUM)==false) --and (UsedInBox(Array2D,NUM,ROW,COLL)==false))
--~ return UsedInBox(Array2D,NUM,ROW,COLL)==false
end

--

function SolveSudoku(Array2D)

	if(false==FindUnassingedLoc(Array2D)) then return true
		else
		for	num=1,9 do
		NUM=''..num
			if(NoConflicts(Array2D,ROW,COLL,NUM)==true)
			then Array2D[ROW][COLL] = NUM

			if(SolveSudoku(Array2D)==true) then
				else Array2D[ROW][COLL]= '0';

				end
			end
		end
	end
return false
end


FindUnassingedLoc(Sudoku)
--~ print(ROW,COLL)

--~ NUM=''.. 3
--~ print(NUM,NoConflicts(Sudoku,ROW,COLL,NUM))
--~ print(NUM,NoConflicts(Sudoku,ROW,COLL,NUM))
SolveSudoku(Sudoku)

Display()
--~ DisplayPara(3,3)
