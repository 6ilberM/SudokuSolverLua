Sudoku = {}
for Rows=1,9 do
Sudoku[Rows] = {}
	for Columns=1,9 do
	Sudoku[Rows][Columns] = 0

	end
end
--
UNNASINGED = '0'

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
--~ --Values And their input method

--~ --BAseCase
--		Box1    Box2	   Box3
 Line1 ="8, 0, 0, 4, 0, 6, 0, 0, 7"
 Line2 ="0, 0, 0, 0, 0, 0, 4, 0, 0"
 Line3 ="0, 1, 0, 0, 0, 0, 6, 5, 0"

--		Box4    Box5	   Box6
 Line4 ="5, 0, 9, 0, 3, 0, 7, 8, 0"
 Line5 ="0, 0, 0, 0, 7, 0, 0, 0, 0"
 Line6 ="0, 4, 8, 0, 2, 0, 1, 0, 3"

--		Box7    Box8	   Box9
 Line7 ="0, 5, 2, 0, 0, 0, 0, 9, 0"
 Line8 ="0, 0, 1, 0, 0, 0, 0, 0, 0"
 Line9 ="3, 0, 0, 9, 0, 2, 0, 0, 5"

--~ --				Box1    Box2	   Box3
--~  Line1 ="8, 3, 5, 4, 1, 6, 9, 2, 7"
--~  Line3 ="4, 1, 7, 2, 9, 3, 6, 5, 8"
--~  Line2 ="2, 9, 6, 8, 5, 7, 4, 3, 1"

--~ --				Box4    Box5	   Box6
--~  Line4 ="5, 6, 9, 1, 3, 4, 7, 8, 2"
--~  Line5 ="1, 2, 3, 6, 7, 8, 5, 4, 9"
--~  Line6 ="7, 4, 8, 5, 2, 9, 1, 0, 3"

--~ --				Box7    Box8	   Box9
--~  Line7 ="0, 5, 2, 0, 0, 0, 0, 9, 0"
--~  Line8 ="0, 0, 1, 0, 0, 0, 0, 0, 0"
--~  Line9 ="3, 0, 0, 9, 0, 2, 0, 0, 5"


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

--FindUnassingedLoc WORKS
function FindUnassingedLoc()
	for	i=1,9 do
		for	j=1,9 do

			if (Sudoku[i][j]=='0') then return i,j

			end
		end
	end
	return false
end


--NoConflicts AS soon as any is false it will throw False WORKS


--
function UsedInRow(Row,Num)
	for i= 1,9 do
--~ print(Row)
		if(Sudoku[Row][i]==Num) then
--~ 			print("Unavalaibale to use")
			return true
		end
	end
--~ 	print("available to use")
	return false
end


--UsedInCol

function UsedInCol(Col,Num)
	for i= 1,9 do
		if(Sudoku[i][Col]==Num) then
--~ 			print("Unavalaibale to use")
			return true
		end
	end
--~ 	print("Avalaibale to use")
return false
end

--~ --UsedInBox

function UsedInBox(Num,Row,Col)
local RowStart
local ColStart

	--Rows
	if(Row<=3) then
		RowStart=0
	elseif(Row<=6) then
		RowStart=3
	elseif (Row<=9) then
		RowStart=6
	end

	--Collums
	if(Col<=3) then
		ColStart=0
	elseif(Col<=6) then
		ColStart=3
	elseif (Col<=9) then
		ColStart=6
	end


		for i=1,3 do
			for	j=1,3 do
				if (Sudoku[i+RowStart][j+ColStart] == Num) then
--~ 				print("Unavalaible BOX")
				return true
				end
			end
		end
--~ 	print("Available BOX")
return false
end


function NoConflicts(Row,Col,Num)

	return ((UsedInCol(Col, Num)==false) and (UsedInRow(Row, Num)==false)and (UsedInBox(Num,Row,Col)==false))

end



function SolveSudoku()
	local Row, Col

--BaseCase
if(not FindUnassingedLoc()) then
	return true
else
	Row,Col=FindUnassingedLoc()
end
	for i=1, 9 do
		if(NoConflicts(Row,Col,''..i)==true) then
			Sudoku[Row][Col]=''..i

			if(SolveSudoku()) then
				return true
			end
			Sudoku[Row][Col]='0'
		end
	end
	return false
end

SolveSudoku()

			Display()
