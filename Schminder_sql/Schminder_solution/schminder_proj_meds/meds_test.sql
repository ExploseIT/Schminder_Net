


use [schminder_db]
go

select * from vwMed where med_name like '%positive control%' or med_name like '%positive%' or med_name like '%negative%' order by med_name asc
select * from vwMed where med_name like '%insulin human%' or med_name like '%insulin_human%' order by med_name asc
select v.vmp_name, replace (v.vmp_name, 'insulin human', 'Insulin_human') from tblVmpp v LEFT JOIN tblAmpp a ON v.vmp_vppid = a.amp_vppid
where v.vmp_name like '%insulin human%'

select v.vmp_name, a.amp_name from tblVmpp v LEFT JOIN tblAmpp a ON v.vmp_vppid = a.amp_vppid
where v.vmp_name like '%insulin%'

select * from vwMed where med_name like '%control%' order by med_name asc

declare @tab table
(
 medId bigint
 , medPid bigint
 ,medNameIndiv nvarchar(200)
 ,medNameBoth nvarchar(400)
)
insert into @tab
exec spMedIndivListAll2_0
select * from @tab where medNameIndiv like '%maxitrol%' or medNameIndiv like '%Acetazolamide%'
or medNameIndiv like '%nepafenac%' or medNameIndiv like '%lantus%' or medNameIndiv = 'novorapid'
or medNameIndiv like '%anal%' or medNameIndiv = 'control' or medNameIndiv = 'fiasp' or medNameIndiv = 'insulin'

go


select * from tblMedIndiv where med_name_indiv like '%maxitrol%' or med_name_indiv like '%Acetazolamide%'
or med_name_indiv like '%nepafenac%' or med_name_indiv like '%lantus%' or med_name_indiv = 'novorapid'
or med_name_indiv like '%anal%' or med_name_indiv = 'control' or med_name_indiv like '%insulin%'

exec spMedSearchByName 'Anal'
exec spMedSearchByName 'Maxitrol'
exec spMedSearchByName 'Acetazol'
exec spMedSearchByName 'Nepafenac'
exec spMedSearchByName 'Lantus'
exec spMedSearchByName 'NovoRapid, flexpen, 100 units, novo nordisk, 3ml'
exec spMedSearchByName 'Anal'
exec spMedSearchByName 'Control'


declare @tab table
(
 med_id bigint
 , med_pid bigint
 ,med_name_indiv nvarchar(200)
 ,med_name_both nvarchar(400)
)
insert into @tab
exec spMedIndivListAll


select * from @tab where med_name_indiv like '%maxitrol%' or med_name_indiv like '%Acetazolamide%'
or med_name_indiv like '%nepafenac%' or med_name_indiv like '%lantus%' or med_name_indiv = 'novorapid'
or med_name_indiv like '%anal%' or med_name_indiv = 'control' or med_name_indiv = 'fiasp' or med_name_indiv = 'insulin'



goto skip

select * from vwAmppVmpp where amp_name like '%novorapid%' or vmp_name like '%novorapid%'
--exec spMedSearchByName 'Maxitrol'
--exec spMedSearchByName 'Acetazol'
--exec spMedSearchByName 'Nepafenac'

goto skip




exec spMedSearchByName 'NovoRapid'

skip:
