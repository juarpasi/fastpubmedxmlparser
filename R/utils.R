find_text_for <- \(xpath)\(xml_doc) xml2::xml_find_first(xml_doc, xpath)|> xml2::xml_text()
