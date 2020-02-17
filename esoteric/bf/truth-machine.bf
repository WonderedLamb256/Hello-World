++++++++++++++++++++++++++++++++++++++++++++++++ (Add ascii 48 to cell 0)
>+++++++++++++++++++++++++++++++++++++++++++++++++< (Add ascii 49 to cell 1)
>>, (Ask for input on cell 2)
------------------------------------------------
(Take away 48 due to the way ascii tables are formatted)
[ (Start loop if not 0)
      << (Go to default cell 0)
      [ (If the program is 0 skip over If it’s 1 or up empty
the cell (to prevent going to higher cells) then go to cell 1 and
begin printing 1)
            -
      ]
      >[
            .
      ]]
]

<<. (The 1 or above can’t get here due to their loop)
