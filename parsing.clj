(ns parsing
  (:require [clojure.data.csv :as csv]
            [clojure.java.io :as io]
            [clojure.pprint :as pp]))

(defn load-colors
  ([] (load-colors "penumbra.tsv"))
  ([filename]
   (with-open [reader (io/reader filename)]
     (doall
      (csv/read-csv reader :separator \tab)))))

(defn split-by-color
  "Generate flat list of hashes with colors as records."
  []
  (let [[header & colors] (load-colors)
        header (map keyword header)]
    (map #(zipmap header %) colors)))

(defn pretty-spit!
  [file-name collection]
  (spit (java.io.File. file-name)
        (with-out-str (pp/write collection :dispatch pp/code-dispatch))))

(comment
  (pretty-spit! "prenumbra.edn" (split-by-color))
  (def data (split-by-color))
  (->> data
       (filter #(and (= (:set %) "balanced")
                     (= (:palette %) "seven")))
       (map #(select-keys % [:name :rgb_hex]))
       )
  )
