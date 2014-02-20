class AutoVivification(dict):
    """Implementation of perl's autovivification feature."""

    def __getitem__(self, item):
        try:
            return dict.__getitem__(self, item)
        except KeyError:
            value = self[item] = type(self)()
            return value


if __name__ == '__main__':
    import sys
    import glob
    #recolect data from command line
    args = sys.argv
    lista = ["AGE", "EDUC", "FAQ", "LDELTOTAL"]
    if len(args) <= 1:
        raise NameError('there is no args Fucking mother fucker. Asshole')
    features_vector = AutoVivification()
    for i, feature in enumerate(args[1:]):
        if ":" not in feature:
            raise NameError("The : sign was not founded. Maybe a retarded monkey at keyboard?")
        features_vector[feature[:feature.find(":")].upper()] = feature[feature.find(":") + 1:]
    
    for elemento in lista:
        if elemento not in features_vector:
            raise NameError("Feature %s not found, please, insert that fucking variable. Retarded." %elemento)

    print("0 93.3")
    
    
    
    
