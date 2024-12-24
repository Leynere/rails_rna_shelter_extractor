class AssociationFactory
    # csvRow: Array of key value pair.
    def self.isValidAssociation(csvRow)
        ((csvRow["objet_social1"].to_s.eql? "024026") or (csvRow["objet_social2"].to_s.eql? "024026")) and csvRow["position"].to_s.eql? "A"
    end


    # csvRow: Array of key value pair.
    def self.createFromDataGouvCSVLine(csvRow)
        if isValidAssociation(csvRow)
            return Association.new(
                id: csvRow["id"],
                id_ex: csvRow["id_ex"],
                siret: csvRow["siret"],
                date_creat: csvRow["date_creat"],
                titre: csvRow["titre"],
                titre_court: csvRow["titre_court"],
                objet: csvRow["objet"],
                adrg_complemid: csvRow["adrg_complemid"],
                adrg_complemgeo: csvRow["adrg_complemgeo"],
                adrg_libvoie: csvRow["adrg_libvoie"],
                adrg_distrib: csvRow["adrg_distrib"],
                adrg_codepostal: csvRow["adrg_codepostal"],
                adrg_achemine: csvRow["adrg_achemine"],
                adrg_pays: csvRow["adrg_pays"],
                site_web: csvRow["site_web"]
            )
        end
        nil
    end
end
