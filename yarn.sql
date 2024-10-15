

select * from tbl_01_TR TR inner join tbl_01_TRDetail TRD on TR.TrID = TRD.TrID

where TR.TrType in (115, 25, 76, 79, 114, 11, 22, 23, 26, 75, 77, 78, 24) -- and (TRD.YarnQuality = 0 or TRD.YarnQuality is null)

and TrDate > '2023-08-31' -- and TRD.Quantity_Cr > 0









