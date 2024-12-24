# README

RNA shelter data extractor using rails and docker.
Also some test for scraping (futur work) with nokogiri and http.

For testing only docker is mandatory.

For all orperation, run docker first: 

    sh build_and_run.sh

Run tests: 

    sh test_all.sh

To see scrapping test with http and nokogiri, run GET request with:

    http://0.0.0.0:3000/api/scrap/scrap-test

To see result of extraction, run POST request with:

    http://0.0.0.0:3000/api/scrap/association?url=https%3A%2F%2Fmedia.interieur.gouv.fr%2Frna%2Frna_waldec_20241101.zip

To stop docker, run:

    sh stop.sh

The extraction run is long (several minutes). At the end, you have a list of filtered infos of active animal protection association in France.