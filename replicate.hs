replic :: Int -> a -> [a]
replic n t = 
    if n <= 0 
        then []
        else t : replic (n-1) t


iseven :: Int -> Bool
iseven a = 
    if a == 0
        then True
        else isodd (a - 1)

isodd :: Int -> Bool
isodd a =
    if a == 0
        then False
        else iseven (a - 1)



