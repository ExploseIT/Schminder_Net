
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Runtime.Intrinsics.Arm;
using System.Xml;
using System.Xml.Linq;

namespace Schminder_Net.ef
{
    public class ent_mpp : cIsDbNull
    {
        private dbContext? dbCon { get; } = null;
        private Exception? exc = null;

        public ent_mpp()
        {
        }

        public ent_mpp(dbContext dbCon)
        {
            this.dbCon = dbCon;
        }


        public HashSet<string> PrintVmppElementNames(string filePath)
        {
            var doc = XDocument.Load(filePath);
            var ns = doc.Root.GetDefaultNamespace(); // Use this if elements are namespace-qualified

            var amppElements = doc.Descendants(ns + "VMPP");

            var elementNames = new HashSet<string>();

            foreach (var ampp in amppElements)
            {
                foreach (var element in ampp.Elements())
                {
                    elementNames.Add(element.Name.LocalName);
                }
            }

            return elementNames;

        }

        public HashSet<string> PrintAmppElementNames(string filePath)
        {
            var doc = XDocument.Load(filePath);
            var ns = doc.Root.GetDefaultNamespace(); // Use this if elements are namespace-qualified

            var amppElements = doc.Descendants(ns + "AMPP");

            var elementNames = new HashSet<string>();

            foreach (var ampp in amppElements)
            {
                foreach (var element in ampp.Elements())
                {
                    elementNames.Add(element.Name.LocalName);
                }
            }

            return elementNames;

        }

        public c_ampp ReadFirstAmpp(string filePath)
        {
            using var reader = XmlReader.Create(filePath);
            while (reader.Read())
            {
                if (reader.NodeType == XmlNodeType.Element && reader.Name == "AMPP")
                {
                    var element = XElement.ReadFrom(reader) as XElement;
                    var amp = new c_ampp
                    {
                        amp_appid = long.Parse(element.Element("APPID")?.Value ?? "0"),
                        amp_apid = long.Parse(element.Element("APID")?.Value ?? "0"),
                        amp_vppid = long.Parse(element.Element("VPPID")?.Value ?? "0"),
                        amp_name = element.Element("NM")?.Value ?? "",
                        amp_invalid = element.Element("INVALID")?.Value,
                        amp_legal_catcode = element.Element("LEGAL_CATCD")?.Value,
                        amp_subp = element.Element("SUBP")?.Value ?? "",
                        amp_disccd = element.Element("DISCCD")?.Value ?? "",
                        amp_dtdisc = DateOnly.TryParse(element.Element("DISCDT")?.Value, out var discDate) ? discDate : null,
                        //amp_dtdisc = element.Element("DISCDT")?.Value,
                        amp_combpackcd = element.Element("COMBPACKCD")?.Value ?? ""
                    };
                    return amp;
                }
            }
            return null;
        }

        public List<c_ampp> ParseAmppXmlWhere(string filePath, string where)
        {
            var doc = XDocument.Load(filePath);
            var ns = doc.Root.GetDefaultNamespace(); // Get namespace if used

            var entries = doc.Descendants(ns + "AMPP")
                .Where(x => (x.Element(ns + "NM")?.Value ?? "").ToLower().Contains(where))
                .Select(x => new c_ampp
                {
                    amp_appid = long.Parse(x.Element(ns + "APPID")?.Value ?? "0"),
                    amp_apid = long.Parse(x.Element(ns + "APID")?.Value ?? "0"),
                    amp_vppid = long.Parse(x.Element(ns + "VPPID")?.Value ?? "0"),
                    amp_name = x.Element(ns + "NM")?.Value ?? "",

                    amp_invalid = x.Element(ns + "INVALID")?.Value,
                    amp_legal_catcode = x.Element(ns + "LEGAL_CATCD")?.Value,
                    amp_subp = x.Element(ns + "SUBP")?.Value ?? "",
                    amp_disccd = x.Element(ns + "DISCCD")?.Value ?? "",
                    amp_dtdisc = DateOnly.TryParse(x.Element(ns + "DISCDT")?.Value, out var discDate) ? discDate : null,
                    amp_combpackcd = x.Element(ns + "COMBPACKCD")?.Value ?? ""
                })
                .ToList();

            return entries;
        }

        public List<c_ampp> ParseAmppXml(string filePath)
        {
            var doc = XDocument.Load(filePath);
            var ns = doc.Root.GetDefaultNamespace(); // Get namespace if used

            var entries = doc.Descendants(ns + "AMPP")
                .Select(x => new c_ampp
                {
                    amp_appid = long.Parse(x.Element(ns + "APPID")?.Value ?? "0"),
                    amp_apid = long.Parse(x.Element(ns + "APID")?.Value ?? "0"),
                    amp_vppid = long.Parse(x.Element(ns + "VPPID")?.Value ?? "0"),
                    amp_name = x.Element(ns + "NM")?.Value ?? "",

                    amp_invalid = x.Element(ns + "INVALID")?.Value,
                    amp_legal_catcode = x.Element(ns + "LEGAL_CATCD")?.Value,
                    amp_subp = x.Element(ns + "SUBP")?.Value ?? "",
                    amp_disccd = x.Element(ns + "DISCCD")?.Value ?? "",
                    amp_dtdisc = DateOnly.TryParse(x.Element(ns + "DISCDT")?.Value, out var discDate) ? discDate : null,
                    // amp_dtdisc = x.Element(ns + "DISCDT")?.Value,
                    amp_combpackcd = x.Element(ns + "COMBPACKCD")?.Value ?? ""
                })
                //.Skip(0).Take(1)
                .ToList();

            return entries;
        }

        public List<c_vmpp> ParseVmppXml(string filePath)
        {
            var doc = XDocument.Load(filePath);
            var ns = doc.Root.GetDefaultNamespace(); // Get namespace if used

            var entries = doc.Descendants(ns + "VMPP")
                //.Where(x => (x.Element(ns + "NM")?.Value ?? "").ToLower().Contains("nepafenac"))
                .Select(x => new c_vmpp
                {
                    vmp_vppid = long.Parse(x.Element(ns + "VPPID")?.Value ?? "0"),
                    vmp_vpid = long.Parse(x.Element(ns + "VPID")?.Value ?? "0"),

                    vmp_name = x.Element(ns + "NM")?.Value ?? "",

                    vmp_invalid = x.Element(ns + "INVALID")?.Value,
                    vmp_combpackcd = x.Element(ns + "COMBPACKCD")?.Value ?? "",
                    vmp_qtyval = x.Element(ns + "QTYVAL")?.Value ?? "",
                    vmp_uomcd = x.Element(ns + "QTY_UOMCD")?.Value ?? ""
                })
                //.Skip(0).Take(1)
                .ToList();

            return entries;
        }

        public c_ampp doAmpUpdate(c_ampp p)
        {
            c_ampp ret = new c_ampp();

            try
            {
                SqlParameter[] lParams = {
                new SqlParameter("@amp_appid", SqlDbType.BigInt, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.amp_appid)
                , new SqlParameter("@amp_apid", SqlDbType.BigInt, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.amp_apid)
                , new SqlParameter("@amp_vppid", SqlDbType.BigInt, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.amp_vppid)
                , new SqlParameter("@amp_name", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.amp_name)
                , new SqlParameter("@amp_legal_catcode", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.amp_legal_catcode)
                , new SqlParameter("@amp_combpackcd", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.amp_combpackcd)
                , new SqlParameter("@amp_subp", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.amp_subp)
                , new SqlParameter("@amp_disccd", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.amp_disccd)
                , new SqlParameter("@amp_invalid", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, IsDbNull(p.amp_invalid))
                , new SqlParameter("@amp_dtdisc", SqlDbType.Date, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, IsDbNull(p.amp_dtdisc))
            };

                var sp = "spAmppUpdate @amp_appid, @amp_apid, @amp_vppid, @amp_name, @amp_legal_catcode, @amp_combpackcd, @amp_subp, @amp_disccd, @amp_invalid, @amp_dtdisc";


                var retSP = this.dbCon?.lAmpp.FromSqlRaw(sp, lParams).AsEnumerable();

                if (retSP != null && retSP.Count() > 0)
                {
                    ret = retSP?.FirstOrDefault()!;
                }

            }
            catch (Exception ex)
            {
                exc = ex;
            }

            return ret;
        }

        public c_ampp? doAmpReadById(long appid)
        {
            c_ampp? ret = null;

            try
            {
                SqlParameter[] lParams = {
                    new SqlParameter("@amp_appid", SqlDbType.BigInt, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, appid)
                };

                var sp = "spAmppReadById @amp_appid";

                var retSP = this.dbCon?.lAmpp.FromSqlRaw(sp, lParams).AsEnumerable();

                if (retSP != null && retSP.Count() > 0)
                {
                    ret = retSP?.FirstOrDefault()!;
                }
            }
            catch (Exception ex)
            {
                exc = ex;
            }
            return ret;
        }

        public List<c_ampp> doAmpUpdateList(List<c_ampp> l_Ampps)
        {
            List<c_ampp> ret = new List<c_ampp>();

            foreach (c_ampp i_ampp in l_Ampps)
            {
                var i_ret = doAmpUpdate(i_ampp);
                ret.Add(i_ret);
            }

            return ret;
        }

        public List<c_ampp> doAmpUpdateListWithCheck(List<c_ampp> l_Ampps)
        {
            List<c_ampp> ret = new List<c_ampp>();
            bool found = false;
            foreach (c_ampp i_ampp in l_Ampps)
            {
                var i_read = doAmpReadById(i_ampp.amp_appid);
                if (i_read != null)
                {
                    found = true;
                }
                else
                {
                    var i_ret = doAmpUpdate(i_ampp);
                    ret.Add(i_ret);
                }
            }

            return ret;
        }

        public List<c_vmpp> doVmpUpdateList(List<c_vmpp> l_Vmpps)
        {
            List<c_vmpp> ret = new List<c_vmpp>();

            foreach (c_vmpp i_vmpp in l_Vmpps)
            {
                var i_ret = doVmpUpdate(i_vmpp);
                ret.Add(i_ret);
            }

            return ret;
        }

        public c_vmpp doVmpUpdate(c_vmpp p)
        {
            c_vmpp ret = new c_vmpp();

            try
            {
                SqlParameter[] lParams = {
                new SqlParameter("@vmp_vppid", SqlDbType.BigInt, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.vmp_vppid)
                , new SqlParameter("@vmp_vpid", SqlDbType.BigInt, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.vmp_vpid)
                , new SqlParameter("@vmp_name", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.vmp_name)
                , new SqlParameter("@vmp_combpackcd", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.vmp_combpackcd)
                , new SqlParameter("@vmp_qtyval", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.vmp_qtyval)
                , new SqlParameter("@vmp_uomcd", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.vmp_uomcd)
                , new SqlParameter("@vmp_invalid", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, IsDbNull(p.vmp_invalid))
            };

                var sp = "spVmppUpdate @vmp_vppid, @vmp_vpid, @vmp_name, @vmp_combpackcd, @vmp_qtyval, @vmp_uomcd, @vmp_invalid";


                var retSP = this.dbCon?.lVmpp.FromSqlRaw(sp, lParams).AsEnumerable();

                if (retSP != null && retSP.Count() > 0)
                {
                    ret = retSP?.FirstOrDefault()!;
                }

            }
            catch (Exception ex)
            {
                exc = ex;
            }

            return ret;
        }

        public c_vmpp? doVmpReadById(long appid)
        {
            c_vmpp? ret = null;

            try
            {
                SqlParameter[] lParams = {
                    new SqlParameter("@vmp_vppid", SqlDbType.BigInt, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, appid)
                };

                var sp = "spVmppReadById @vmp_vppid";

                var retSP = this.dbCon?.lVmpp.FromSqlRaw(sp, lParams).AsEnumerable();

                if (retSP != null && retSP.Count() > 0)
                {
                    ret = retSP?.FirstOrDefault()!;
                }
            }
            catch (Exception ex)
            {
                exc = ex;
            }
            return ret;
        }


        public List<c_med> doMedSearchbyName(string med_search)
        {
            List<c_med> ret = new List<c_med>();
            try
            {
                SqlParameter[] lParams = {
                    new SqlParameter("@med_search", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, IsDbNull(med_search))
                };

                var sp = "spMedSearchByName @med_search";

                var retSP = this.dbCon?.lMeds.FromSqlRaw(sp, lParams).AsEnumerable();

                if (retSP != null && retSP.Count() > 0)
                {
                    ret = retSP?.ToList()!;
                }

            }
            catch (Exception ex)
            {
                exc = ex;
            }

            return ret;
        }

        public List<c_med_indiv> doMedListAll()
        {
            List<c_med_indiv> ret = new List<c_med_indiv>();
            try
            {
                SqlParameter[] lParams = {
                   
                };

                var sp = "spMedListAll";

                var retSP = this.dbCon?.lMedIndivs.FromSqlRaw(sp, lParams).AsEnumerable();

                if (retSP != null && retSP.Count() > 0)
                {
                    ret = retSP?.ToList()!;
                }

            }
            catch (Exception ex)
            {
                exc = ex;
            }

            return ret;
        }
    }

    public class c_med_indiv_info
    {
        public string med_indiv_name { get; set; } = $"med_indiv_"+ DateTime.Now.ToString("yyyyMMdd_HHmm");
        public List<c_med_indiv>? med_indiv_list { get; set; } = null;
    }

    public class c_med_indiv
    {
        [Key]
        public long med_id { get; set; }
        public long med_pid { get; set; }
        public string? med_name { get; set; } = null;
    }

    public class c_med
    {
        [Key]
        public long med_id { get; set; }
        public long med_pid { get; set; }
        public string? med_whole { get; set; } = null;
        public double? med_qtyval { get; set; } = null;
        public string? med_uomcd { get; set; } = null;
    }


    public class c_vmpp
    {
        [Key]
        public long vmp_vppid { get; set; }
        public long vmp_vpid { get; set; }
        public string? vmp_name { get; set; }
        public string? vmp_combpackcd { get; set; } = null;
        public string? vmp_qtyval { get; set; } = null;
        public string? vmp_uomcd { get; set; } = null;
        public string? vmp_invalid { get; set; } = null;
    }


    public class c_ampp
    {
        [Key]
        public long amp_appid { get; set; }
        public long amp_apid { get; set; }
        public long amp_vppid { get; set; }
        public string? amp_name { get; set; }
        public string? amp_legal_catcode { get; set; }
        public string? amp_subp { get; set; } = null;
        public DateOnly? amp_dtdisc { get; set; } = null;
        public string? amp_invalid { get; set; } = null;
        public string? amp_combpackcd { get; set; } = null;
	    public string? amp_disccd { get; set; } = null;

    }

    public class c_amppvmpp
    {
        public long vmp_vpid { get; set; } = 0;
        public long vmp_vppid { get; set; } = 0;
        public string vmp_name { get; set; } = "";
        //vmp_combpackcd,
        public string vmp_qtyval { get; set; } = "";
        public long vmp_uomcd { get; set; } = 0;
        public string amp_name { get; set; } = "";
        //amp_subp,
        //amp_legal_catcode
    }
}

