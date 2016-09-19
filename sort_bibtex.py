def sort_bibtex_by_key(bib_file, key='ID'):
    import bibtexparser

    with open(bib_file) as file:
        db = bibtexparser.load(file)

    entries = db.get_entry_list()
    entries_sorted = sorted(entries, key=lambda entry: entry[key])
    db.entries = entries_sorted

    with open(bib_file, 'w') as file:
        bibtexparser.dump(db, file)


if __name__ == '__main__':
    sort_bibtex_by_key('imbalanced-bibtex.bib')
