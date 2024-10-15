

SELECT      TOP 100 PERCENT dbo.tbl_01_TR.BranchFrom, dbo.tblSys_Branch.BranchName, dbo.tbl_01_TRDetail.ItemControl, 
tbl_01_GateItems_1.Title AS YarnGroup, dbo.tbl_01_TRDetail.Item AS YarnCount, dbo.tbl_01_GateItems.Title,
(CASE WHEN (bbf = 1 OR
(trdate < tr_datefrom AND trdate >= FinancialYear)) AND inward = 1 THEN quantity ELSE 0 END) - (CASE WHEN (bbf = 1 OR
(trdate < tr_datefrom AND trdate >= FinancialYear)) AND inward = 0 THEN quantity ELSE 0 END) AS OpnKgs,
CASE WHEN (bbf <> 1 AND 
trdate BETWEEN tr_datefrom AND tr_dateTo) AND inward = 1 THEN quantity ELSE 0 END AS KgsIn
--SUM(CASE WHEN (bbf <> 1 AND trdate BETWEEN 
--tr_datefrom AND tr_dateTo) AND inward = 0 THEN quantity ELSE 0 END) AS KgsOut, 
--SUM((CASE WHEN (trdate BETWEEN financialyear AND 
--tr_dateto) AND inward = 1 THEN quantity ELSE 0 END) - (CASE WHEN (trdate BETWEEN financialyear AND tr_dateto) AND 
--inward = 0 THEN quantity ELSE 0 END)) AS BalKgs, 
--SUM((CASE WHEN (bbf = 1 OR
--(trdate < tr_datefrom AND trdate >= FinancialYear)) AND inward = 1 THEN pcs ELSE 0 END) - (CASE WHEN (bbf = 1 OR
--(trdate < tr_datefrom AND trdate >= FinancialYear)) AND inward = 0 THEN pcs ELSE 0 END)) AS OpnBags, 
--SUM(CASE WHEN (bbf <> 1 AND 
--trdate BETWEEN tr_datefrom AND tr_dateTo) AND inward = 1 THEN Pcs ELSE 0 END) AS BagsIn, 
--SUM(CASE WHEN (bbf <> 1 AND trdate BETWEEN 
--tr_datefrom AND tr_dateTo) AND inward = 0 THEN Pcs ELSE 0 END) AS BagsOut, 
--SUM((CASE WHEN (trdate BETWEEN financialyear AND 
--tr_dateto) AND inward = 1 THEN Pcs ELSE 0 END) - (CASE WHEN (trdate BETWEEN financialyear AND tr_dateto) AND 
--inward = 0 THEN Pcs ELSE 0 END)) AS BalBags, dbo.tblSys_Branch.BranchAbrv


FROM          dbo.tbl_01_TR INNER JOIN
dbo.tbl_01_TRDetail ON dbo.tbl_01_TR.TrID = dbo.tbl_01_TRDetail.TrID INNER JOIN
dbo.tbl_01_TRType ON dbo.tbl_01_TR.TrType = dbo.tbl_01_TRType.TrType INNER JOIN
dbo.tbl_01_GateItems ON dbo.tbl_01_TRDetail.Item = dbo.tbl_01_GateItems.GateItem INNER JOIN
dbo.tbl_01_GateItems tbl_01_GateItems_1 ON dbo.tbl_01_TRDetail.ItemControl = tbl_01_GateItems_1.GateItem INNER JOIN
dbo.tblSys_Branch ON dbo.tbl_01_TR.BranchFrom = dbo.tblSys_Branch.BranchCode INNER JOIN
dbo.tbl_00_Parameters ON dbo.tbl_01_TR.BranchFrom = dbo.tbl_00_Parameters.Tr_BranchFrom
WHERE      (dbo.tbl_00_Parameters.userno = 19) AND (dbo.tbl_01_TRType.TrDetail = 62) AND (dbo.tbl_01_TRType.TrType = 114 OR
dbo.tbl_01_TRType.TrType = 11 OR
dbo.tbl_01_TRType.TrType = 22 OR
dbo.tbl_01_TRType.TrType = 23 OR
dbo.tbl_01_TRType.TrType = 26 OR
dbo.tbl_01_TRType.TrType = 75 OR
dbo.tbl_01_TRType.TrType = 77 OR
dbo.tbl_01_TRType.TrType = 78 OR
dbo.tbl_01_TRType.TrType = 24) AND (dbo.tbl_01_TR.TrDate BETWEEN '2023-08-01' AND dbo.tbl_00_Parameters.Tr_DateTo)
--GROUP BY dbo.tbl_01_TRDetail.Item, dbo.tbl_01_GateItems.Title, dbo.tbl_01_TR.BranchFrom, dbo.tbl_01_TRDetail.ItemControl, tbl_01_GateItems_1.Title, 
--                        dbo.tblSys_Branch.BranchName, dbo.tblSys_Branch.BranchAbrv
--ORDER BY dbo.tbl_01_TR.BranchFrom, dbo.tbl_01_TRDetail.ItemControl, dbo.tbl_01_TRDetail.Item


--select * from tblSys_UsersErp





