--FONTE https://sqlandme.com/2011/04/27/tsql-concatenate-rows-using-for-xml-path/

select STUFF((    SELECT ' ' + CAMPO AS [text()]                        
                        FROM #TABELADADOSLINHA TL
                        WHERE TL.ID = TD.IDTABELADADOS
						--order by OBS.TGUSEQ
                        FOR XML PATH('')
                        ), 1, 0, ' ' )
