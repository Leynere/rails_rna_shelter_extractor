class Association
  attr_accessor :id,
    :id_ex,
    :siret,
    :date_creat,
    :titre,
    :titre_court,
    :objet,
    :adrg_complemid,
    :adrg_complemgeo,
    :adrg_libvoie,
    :adrg_distrib,
    :adrg_codepostal,
    :adrg_achemine,
    :adrg_pays,
    :site_web

  def initialize(id:,
      id_ex:,
      siret:,
      date_creat:,
      titre:,
      titre_court:,
      objet:,
      adrg_complemid:,
      adrg_complemgeo:,
      adrg_libvoie:,
      adrg_distrib:,
      adrg_codepostal:,
      adrg_achemine:,
      adrg_pays:,
      site_web:
    )
    @id = id
    @id_ex = id_ex
    @siret = siret
    @date_creat = date_creat
    @titre = titre
    @titre_court = titre_court
    @objet = objet
    @adrg_complemid = adrg_complemid
    @adrg_complemgeo = adrg_complemgeo
    @adrg_libvoie = adrg_libvoie
    @adrg_distrib = adrg_distrib
    @adrg_codepostal = adrg_codepostal
    @adrg_achemine = adrg_achemine
    @adrg_pays = adrg_pays
    @site_web = site_web
  end
end
