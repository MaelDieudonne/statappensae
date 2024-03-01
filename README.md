Ce projet explore les effets du statut de propriétaire immobilier sur les comportements électoraux, à partir des données rassemblées par Julia Cagé et Thomas Piketty pour leur ouvrage *Une histoire du conflit politique. Élections et inégalités sociales en France, 1789-2022* (Paris, Le Seuil, 2023).

Il est réalisé dans le cadre de l’enseignement de statistiques appliquées de seconde année à l’Ensae, au premier semestre 2024.

-   Auteurs : Alexis Barrau, Maël Dieudonne et Swann-Émilien Maillefert

-   Encadrants : Pauline Mendras et Gaston Vermersch (INSEE / IPP)

Le code est conçu pour s’exécuter dans l’environnement [Onyxia](https://datalab.sspcloud.fr/) du Datalab de l’Insee ou localement, avec dans le premier cas, un stockage des données dans le SSP Cloud. Il est réparti entre plusieurs notebooks au format Rmd, à exécuter dans cet ordre :


1.  Install_python *(nécessaire seulement pour exécuter le notebook n°3, dispensable si l'on récupère les données depuis le SSP Cloud)*
2.  Dependencies
3.  Fetch_data_main pour récupérer les données mises à disposition par les auteurs sur le [site compagnon](https://unehistoireduconflitpolitique.fr/) du livre
4.  Fetch_data_other pour récupérer d’autres données publiques

*NB : ces deux notebooks s’achèvent pas des chunks destinés au téléversement sur le SSP Cloud. Il faut bien adapter le nom et le chemin du bucket, ou ne pas les exécuter pour rester en local.*

5.  Prepare_data pour construire les bases
6.  Analyze_data pour l’exploitation statistique
7.  3D_map pour les cartes en 3D

Toutes les sorties sont placées dans le répertoire output, au format latex ou png. Les rapports sont disponibles dans le dossier latex.
