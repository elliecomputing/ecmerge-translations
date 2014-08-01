<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:xlink="http://www.w3.org/1999/xlink">

<!-- *************************************************************************
strings used in report.xsl
************************************************************************** -->
<!-- Global constants -->
<xsl:variable name="kg_report_title">Rapport de Comparaison</xsl:variable>

<xsl:variable name="kg_sub_report_title">Rapport de Comparaison de Fichiers</xsl:variable>

<xsl:variable name="kg_statistics_report_title">Statistiques de Comparaison</xsl:variable>

<xsl:variable name="kg_statistics_global_title">Statistiques Globales</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_text_title">Statistiques détaillées</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_image_title">Statistiques détaillées</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_binary_title">Statistiques détaillées</xsl:variable>

<xsl:variable name="kg_statistics_detailed_text_title">Statistiques détaillées pour les fichiers texte</xsl:variable>

<xsl:variable name="kg_statistics_detailed_image_title">Statistiques détaillées pour les fichiers image</xsl:variable>

<xsl:variable name="kg_statistics_detailed_binary_title">Statistiques détaillées pour les fichiers binaires</xsl:variable>

<xsl:template name="kg_report_info">
<xsl:param name="date" />

	<xsl:text>Ce rapport a été généré le </xsl:text>
	<xsl:value-of select="$date" />
	<xsl:text> par Ellié Computing Merge.</xsl:text>
	<br/><xsl:text>&#169; 2005-2011 Ellié Computing </xsl:text>
	<a href="http://www.elliecomputing.com" target="_blank">http://www.elliecomputing.com</a>
	<xsl:text>. Tous droits réservés.</xsl:text>
</xsl:template>

<xsl:variable name="kg_yes">oui</xsl:variable>

<xsl:variable name="kg_no">non</xsl:variable>

<xsl:variable name="kg_description">Description</xsl:variable>

<xsl:variable name="kg_mega_bytes">Mo</xsl:variable>

<xsl:variable name="kg_kilo_bytes">Ko</xsl:variable>

<xsl:variable name="kg_bytes">Octets</xsl:variable>

<xsl:variable name="kg_byteblocks">Blocs d'octets</xsl:variable>

<xsl:variable name="kg_left">Gauche</xsl:variable>

<xsl:variable name="kg_ancestor">Ancêtre</xsl:variable>

<xsl:variable name="kg_right">Droite</xsl:variable>

<xsl:variable name="kg_files_and_folders">Fichiers et Dossiers</xsl:variable>

<xsl:variable name="kg_files">Fichiers</xsl:variable>

<xsl:variable name="kg_blocks">Blocs de texte</xsl:variable>

<xsl:variable name="kg_lines">Lignes</xsl:variable>

<xsl:variable name="kg_image_dimensions">Dimensions d'images</xsl:variable>

<xsl:variable name="kg_pixels">Pixels</xsl:variable>

<xsl:variable name="kg_all_files">Tous les fichiers</xsl:variable>

<xsl:variable name="kg_text_files">Fichiers textes</xsl:variable>

<xsl:variable name="kg_image_files">Fichiers images</xsl:variable>

<xsl:variable name="kg_binary_files">Fichiers binaires</xsl:variable>

<!-- Text Comparison Options -->
<xsl:variable name="kg_text_comparison_options_title">Options de Comparaison Texte</xsl:variable>

<xsl:variable name="kg_match_case">Vérifier la casse des caractères</xsl:variable>

<xsl:variable name="kg_match_line_endings">Vérifier les caractères de fin de ligne</xsl:variable>

<xsl:variable name="kg_match_whitespaces">Vérifier les espaces</xsl:variable>

<xsl:variable name="kg_ws_start">En début de ligne</xsl:variable>

<xsl:variable name="kg_ws_middle">En milieu de ligne</xsl:variable>

<xsl:variable name="kg_ws_end">En fin de ligne</xsl:variable>

<xsl:variable name="kg_blank_lines_empty">Traiter les lignes blanches comme vide</xsl:variable>

<xsl:variable name="kg_in_line_diff_algo">Activer l'algorithme de comparaison</xsl:variable>

<xsl:variable name="kg_in_line_word">Au niveau du mot</xsl:variable>

<xsl:variable name="kg_in_line_char">Au niveau du caractère</xsl:variable>

<xsl:variable name="kg_ignore_line_changes_matching">Ignorer les lignes modifiées correspondant à</xsl:variable>

<xsl:variable name="kg_surround_changes">Encadrer les modifications</xsl:variable>

<xsl:template name="kg_security_distance">
<xsl:param name="line_nb" />

	<xsl:text>avec une distance de sécurité de </xsl:text><xsl:value-of select="$line_nb" /><xsl:text> ligne(s).</xsl:text>
</xsl:template>

<xsl:variable name="kg_security_distance_only_overlap">qui intersectent.</xsl:variable>

<xsl:variable name="kg_security_distance_all_changes">toutes.</xsl:variable>

<!-- Display Options -->
<xsl:variable name="kg_display_options_title">Options d'Affichage</xsl:variable>

<xsl:variable name="kg_display_line_endings">Afficher les caractères de fin de ligne</xsl:variable>

<xsl:variable name="kg_display_line_numbers">Afficher les numéros de ligne</xsl:variable>

<xsl:variable name="kg_display_statistics">Afficher le résumé de la comparaison</xsl:variable>

<!-- Folders Comparison Options -->
<xsl:variable name="kg_folder_comparison_options_title">Options de Comparaison de dossiers</xsl:variable>

<xsl:variable name="kg_relative_path">Chemin relatif</xsl:variable>

<xsl:variable name="kg_presence">Présence</xsl:variable>

<xsl:variable name="kg_folder_depth">Profondeur</xsl:variable>

<xsl:variable name="kg_folder_depth_one">Seuls les fichiers situés dans le premier niveau de profondeur sont comparés</xsl:variable>

<xsl:variable name="kg_folder_depth_all">Les dossiers sont comparés recursivement</xsl:variable>

<xsl:variable name="kg_folder_size_criteria">Critères basés sur la taille</xsl:variable>

<xsl:variable name="kg_folder_diff_size_diff_files">Des tailles différentes impliquent des fichiers différents</xsl:variable>

<xsl:variable name="kg_folder_same_size_same_files">Des tailles égales impliquent des fichiers identiques</xsl:variable>

<xsl:variable name="kg_folder_date_criteria">Critères basés sur la date</xsl:variable>

<xsl:variable name="kg_folder_diff_date_diff_files">Des dates différentes impliquent des fichiers différents</xsl:variable>

<xsl:variable name="kg_folder_same_date_same_files">Des dates égales impliquent des fichiers identiques</xsl:variable>

<xsl:variable name="kg_folder_same_date_and_size_same_files">Seulement si les tailles sont identiques</xsl:variable>

<xsl:variable name="kg_folder_fs_precision">Précision du système de fichiers</xsl:variable>

<xsl:variable name="kg_folder_compensate_fs_precision_loss">Compenser la perte de précision due au système de fichiers</xsl:variable>

<xsl:template name="kg_folders_date_comparison_method">
<xsl:param name="type" />
<xsl:param name="date_diff" />

	<xsl:choose>
	<xsl:when test="$type=1"><xsl:value-of select="$kg_folder_fs_exact" /></xsl:when>
	<xsl:when test="$type=2"><xsl:value-of select="$kg_folder_fs_fixed" /></xsl:when>
	<xsl:otherwise><xsl:value-of select="$kg_folder_fs_multiple" /></xsl:otherwise>
	</xsl:choose>
	
	<xsl:if test="$type!=1">
		<xsl:text> (</xsl:text>
		<xsl:value-of select="number($date_diff) div 60" />
		<xsl:text> minutes)</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:variable name="kg_folder_fs_exact">Dates exactes</xsl:variable>

<xsl:variable name="kg_folder_fs_fixed">Différence fixe</xsl:variable>

<xsl:variable name="kg_folder_fs_multiple">Différence multiple</xsl:variable>

<xsl:variable name="kg_folder_filters_options_title">Options de filtrages</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_title">Filtres par nom</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_include">Filtres d'inclusion</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_exclude">Filtres d'exclusion</xsl:variable>

<xsl:variable name="kg_no_folder_filters_filename">Aucun filtre par nom</xsl:variable>

<xsl:variable name="kg_folder_filters_status_title">Filtres par statut</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_missing">Masquer les fichiers ou dossiers manquants</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_present">Masquer les fichiers ou dossiers présents</xsl:variable>

<xsl:variable name="kg_folder_filters_in_source">dans la vue de gauche</xsl:variable>

<xsl:variable name="kg_folder_filters_in_target">dans la vue de droite</xsl:variable>

<xsl:variable name="kg_folder_filters_in_ancestor">dans la vue ancêtre</xsl:variable>

<xsl:variable name="kg_folder_filters_in_result">dans la vue résultat</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_compared">Masquer les fichiers</xsl:variable>

<xsl:variable name="kg_folder_filters_identical">identiques</xsl:variable>

<xsl:variable name="kg_folder_filters_different">différents</xsl:variable>

<xsl:variable name="kg_folder_filters_conflicting">en conflit</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_others">Autres éléments masqués</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_system_hidden">Fichiers et dossiers cachés du système</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_empty_identical_folders">Dossiers identiques ne contenant aucun élément visible</xsl:variable>

<xsl:variable name="kg_no_folder_filters_status">Aucun filtre par statut</xsl:variable>

<xsl:variable name="kg_folder_filters_filedate_title">Filtres par date</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_by_date_title">Masquer les fichiers modifiés</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_if_everywhere">Exclure un fichier uniquement s'il existe partout</xsl:variable>

<xsl:template name="kg_folder_filters_exclude_files_by_date">
<xsl:param name="before" />
<xsl:param name="nb_days" />
<xsl:param name="date" />
<xsl:param name="use_date" />
	
	<xsl:choose>
	<xsl:when test="$before='yes'"><xsl:text>avant </xsl:text></xsl:when>
	<xsl:otherwise><xsl:text>après </xsl:text></xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
	<xsl:when test="$use_date='yes'">
		<xsl:text>le </xsl:text>
		<xsl:value-of select="$date" />
	</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="kg_days">
			<xsl:with-param name="nb" select="$nb_days" />
		</xsl:call-template>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="kg_days">
<xsl:param name="nb" />
	
	<xsl:choose>
	<xsl:when test="$nb = 1"><xsl:text>1 jour</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> jours</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:variable name="kg_no_folder_filters_filedate">Aucun filtre par date</xsl:variable>

<xsl:variable name="kg_folder_display_options_title">Options d'Affichage</xsl:variable>

<xsl:variable name="kg_folder_show_size">Afficher la taille</xsl:variable>

<xsl:variable name="kg_folder_show_date">Afficher la date</xsl:variable>

<xsl:variable name="kg_folder_show_mime">Afficher le type MIME</xsl:variable>

<xsl:variable name="kg_folder_show_diff_count">Afficher le nombre de différences</xsl:variable>

<!-- Image Options -->
<xsl:variable name="kg_image_comparison_options_title">Options de comparaison des images</xsl:variable>

<xsl:variable name="kg_image_exact_threshold">Seuil d'exactitude</xsl:variable>

<xsl:variable name="kg_image_difference_threshold">Seuil de différence</xsl:variable>

<!-- Binary Options -->
<xsl:variable name="kg_binary_comparison_options_title">Options de comparaison des fichiers binaires</xsl:variable>

<xsl:variable name="kg_binary_max_distance">Distance maximale</xsl:variable>

<xsl:variable name="kg_binary_min_match">Longueur minimale de correspondance</xsl:variable>

<!-- Comparison Statistics -->
<xsl:variable name="kg_statistics_title">Résumé de la Comparaison</xsl:variable>

<xsl:variable name="kg_all_files_explanation">La somme "Tous les fichiers" peut être supérieure
	à la somme des nombres de fichiers par type, en effet, les fichiers désignés comme
	différents par les règles de méta-données (taille, date...) ne sont pas ouverts et leur
	type n'est pas déterminé afin d'accélérer la comparaison.</xsl:variable>

<xsl:template name="kg_statistics_pair_info">
<xsl:param name="one" />
<xsl:param name="two" />
	
	<xsl:text>Entre les sources </xsl:text><xsl:value-of select="$one" /><xsl:text> et </xsl:text><xsl:value-of select="$two" />
</xsl:template>

<xsl:variable name="kg_unchanged_items">Inchangé(e)s</xsl:variable>

<xsl:variable name="kg_changed_items">Changé(e)s</xsl:variable>

<xsl:variable name="kg_inserted_items">Ajouté(e)s</xsl:variable>

<xsl:variable name="kg_deleted_items">Supprimé(e)s</xsl:variable>

<xsl:variable name="kg_ignored_items">Ignoré(e)s</xsl:variable>

<xsl:variable name="kg_similar_items">Similaires</xsl:variable>

<xsl:variable name="kg_all_changes">Tous les changements</xsl:variable>

<xsl:template name="kg_merge_files_conflicts_description">
<xsl:param name="nb" />
	
	<xsl:text>Changements dans </xsl:text>
	<b>
		<xsl:call-template name="kg_conflicts">
			<xsl:with-param name="nb" select="$nb" />
		</xsl:call-template>
	</b>
</xsl:template>

<xsl:template name="kg_merge_folders_with_conflicts">
<xsl:param name="nb" />
	
	<xsl:text>Ce dossier ne peut pas être fusionné automatiquement. </xsl:text>
	<b>
		<xsl:call-template name="kg_conflicts">
			<xsl:with-param name="nb" select="$nb" />
		</xsl:call-template>
	</b>
	<xsl:text> de fichiers nécessite(nt) une résolution manuelle.</xsl:text>
</xsl:template>

<xsl:template name="kg_conflicts">
<xsl:param name="nb" />
	
	<xsl:choose>
	<xsl:when test="$nb = '1'"><xsl:text>1 conflit</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> conflits</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Comparison Details -->
<xsl:variable name="kg_details_title">Détails de la Comparaison</xsl:variable>

<xsl:variable name="kg_details_change_count_3">Cette colonne 'Différences' contient le nombre de différences trouvées entre les arborescences de dossiers de gauche et de droite.</xsl:variable>

<!-- Legend -->
<xsl:variable name="kg_legend_title">Légende</xsl:variable>

<xsl:variable name="kg_unchanged_sample">Exemple d'une ligne inchangée</xsl:variable>

<xsl:variable name="kg_changed_sample">Exemple d'une ligne changée</xsl:variable>

<xsl:variable name="kg_conflicting_sample">Exemple d'une ligne en conflit</xsl:variable>

<xsl:variable name="kg_inserted_sample">Exemple d'une ligne ajoutée</xsl:variable>

<xsl:variable name="kg_deleted_sample">Exemple d'une ligne supprimée</xsl:variable>

<xsl:variable name="kg_ignored_sample">Exemple d'une ligne ignorée</xsl:variable>

<xsl:variable name="kg_unchanged_line">Ligne inchangée</xsl:variable>

<xsl:variable name="kg_changed_line">Ligne changée</xsl:variable>

<xsl:variable name="kg_conflicting_line">Ligne en conflit</xsl:variable>

<xsl:variable name="kg_inserted_line">Ligne ajoutée</xsl:variable>

<xsl:variable name="kg_deleted_line">Ligne supprimée</xsl:variable>

<xsl:variable name="kg_ignored_line">Ligne ignorée</xsl:variable>

<xsl:variable name="kg_unchanged_code">&#160;</xsl:variable>

<xsl:variable name="kg_changed_code">C</xsl:variable>

<xsl:variable name="kg_inserted_code">A</xsl:variable>

<xsl:variable name="kg_deleted_code">S</xsl:variable>

<xsl:variable name="kg_ignored_code">I</xsl:variable>

<xsl:variable name="kg_inline_changed_text">Texte changé</xsl:variable>

<xsl:variable name="kg_inline_inserted_text">Texte ajouté</xsl:variable>

<xsl:variable name="kg_inline_deleted_text">Texte supprimé</xsl:variable>

<!-- Metadata -->
<xsl:variable name="kg_compared_files_titles">Fichiers Comparés</xsl:variable>

<xsl:variable name="kg_compared_images_titles">Images Comparées</xsl:variable>

<xsl:variable name="kg_compared_folders_titles">Dossiers Comparés</xsl:variable>

<xsl:variable name="kg_2way_comparison">Comparaison à 2 sources</xsl:variable>

<xsl:variable name="kg_3way_comparison">Comparaison à 3 sources</xsl:variable>

<xsl:variable name="kg_file_name">Nom</xsl:variable>

<xsl:variable name="kg_last_modified">Modifié le</xsl:variable>

<xsl:variable name="kg_size">Taille</xsl:variable>

<xsl:variable name="kg_encoding">Jeu de caractères</xsl:variable>

<xsl:variable name="kg_encoding_autodetected">auto-détecté</xsl:variable>

<xsl:variable name="kg_encoding_default">par défaut</xsl:variable>

<xsl:variable name="kg_encoding_forced">forcé</xsl:variable>

<xsl:variable name="kg_result_location">Emplacement résultat</xsl:variable>

<xsl:variable name="kg_no_result_location">Aucun emplacement résultat n'est défini. Les actions ne peuvent être déterminées, la colonne correspondante n'est donc pas affichée.</xsl:variable>

<xsl:variable name="kg_missing_file">fichier manquant</xsl:variable>

<xsl:variable name="kg_missing_folder">dossier manquant</xsl:variable>

<xsl:variable name="kg_syntax_colouring_language_used">Langage de colorisation syntaxique</xsl:variable>

<!-- Binary Files Comparison -->
<xsl:variable name="kg_binary_files_identical">Les fichiers binaires sont identiques.</xsl:variable>

<xsl:variable name="kg_binary_files_different">Les fichiers binaires sont différents.</xsl:variable>

<!-- Images Files Comparison -->
<xsl:variable name="kg_images_files_identical">Les images sont identiques.</xsl:variable>

<xsl:variable name="kg_images_files_different">Les images sont différentes.</xsl:variable>

<!-- Text Files Comparison -->
<xsl:template name="kg_skipped_lines">
<xsl:param name="nb" />

	<xsl:choose>
	<xsl:when test="$nb = 1"><xsl:text>1 ligne omise</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> lignes omises</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Folder Comparison -->
<xsl:variable name="kg_merge_result">Résultat de la fusion</xsl:variable>

<xsl:variable name="kg_action">Action</xsl:variable>

<xsl:template name="kg_changes">Diffé<wbr />rences</xsl:template>

<xsl:variable name="kg_changes_col_width">8</xsl:variable>

</xsl:stylesheet>
