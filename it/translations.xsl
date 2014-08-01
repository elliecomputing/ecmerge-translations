<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:xlink="http://www.w3.org/1999/xlink">

<!-- *************************************************************************
strings used in report.xsl
************************************************************************** -->
<!-- Global constants -->
<xsl:variable name="kg_report_title">Rapporto di Comparazione</xsl:variable>

<xsl:variable name="kg_sub_report_title">Rapporto Subordinato della Comparazione</xsl:variable>

<xsl:variable name="kg_statistics_report_title">Statistiche della Comparazione</xsl:variable>

<xsl:variable name="kg_statistics_global_title">Statistiche Globale</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_text_title">Statistiche Dettagliate</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_image_title">Statistiche Dettagliate</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_binary_title">Statistiche Dettagliate</xsl:variable>

<xsl:variable name="kg_statistics_detailed_text_title">Statistiche Dettagliate per i File di Testo</xsl:variable>

<xsl:variable name="kg_statistics_detailed_image_title">Statistiche Dettagliate per le Immagini</xsl:variable>

<xsl:variable name="kg_statistics_detailed_binary_title">Statistiche Dettagliate per le File Binari</xsl:variable>

<xsl:template name="kg_report_info">
<xsl:param name="date" />

	<xsl:text>Questo rapporto This report è stato creato da Ellié Computing Merge il </xsl:text>
	<xsl:value-of select="$date" />
	<xsl:text>.</xsl:text>
	<br/><xsl:text>&#169; 2005-2011 Ellié Computing </xsl:text>
	<a href="http://www.elliecomputing.com" target="_blank">http://www.elliecomputing.com</a>
	<xsl:text>. Tutti i diritti riservati.</xsl:text>
</xsl:template>

<xsl:variable name="kg_yes">si</xsl:variable>

<xsl:variable name="kg_no">no</xsl:variable>

<xsl:variable name="kg_description">Descrizione</xsl:variable>

<xsl:variable name="kg_mega_bytes">Mb</xsl:variable>

<xsl:variable name="kg_kilo_bytes">Kb</xsl:variable>

<xsl:variable name="kg_bytes">Bytes</xsl:variable>

<xsl:variable name="kg_byteblocks">Blocchi di bytes</xsl:variable>

<xsl:variable name="kg_left">Sinistro</xsl:variable>

<xsl:variable name="kg_ancestor">Antenato</xsl:variable>

<xsl:variable name="kg_right">Destro</xsl:variable>

<xsl:variable name="kg_files_and_folders">File e Cartelle</xsl:variable>

<xsl:variable name="kg_files">File</xsl:variable>

<xsl:variable name="kg_blocks">Blocchi</xsl:variable>

<xsl:variable name="kg_lines">Linee</xsl:variable>

<xsl:variable name="kg_image_dimensions">Dimenzioni dell'Immagine</xsl:variable>

<xsl:variable name="kg_pixels">Pixels</xsl:variable>

<xsl:variable name="kg_all_files">Tutti i file</xsl:variable>

<xsl:variable name="kg_text_files">File e testo</xsl:variable>

<xsl:variable name="kg_image_files">Immagini</xsl:variable>

<xsl:variable name="kg_binary_files">File Binarii</xsl:variable>

<!-- Text Comparison Options -->
<xsl:variable name="kg_text_comparison_options_title">Opzioni di Comparazione di Testo</xsl:variable>

<xsl:variable name="kg_match_case">Coincindere Maiuscole/Minuscole</xsl:variable>

<xsl:variable name="kg_match_line_endings">Coincidere i terminatori di linea</xsl:variable>

<xsl:variable name="kg_match_whitespaces">Coincidere i spazi</xsl:variable>

<xsl:variable name="kg_ws_start">All'inizio delle linee</xsl:variable>

<xsl:variable name="kg_ws_middle">Nel mezzo delle linee</xsl:variable>

<xsl:variable name="kg_ws_end">Alla fine delle linee</xsl:variable>

<xsl:variable name="kg_blank_lines_empty">Bianche linee come vuote</xsl:variable>

<xsl:variable name="kg_in_line_diff_algo">Attivare l'algoritmo di comparazione</xsl:variable>

<xsl:variable name="kg_in_line_word">Al livello della parola</xsl:variable>

<xsl:variable name="kg_in_line_char">Al livello del caratere</xsl:variable>

<xsl:variable name="kg_ignore_line_changes_matching">Ignorare i cambiamenti nelle linee che verificano il pattern</xsl:variable>

<xsl:variable name="kg_surround_changes">Incornicia i cambiamenti</xsl:variable>

<xsl:template name="kg_security_distance">
<xsl:param name="line_nb" />

	<xsl:text>distante di meno di </xsl:text><xsl:value-of select="$line_nb" /><xsl:text> linea(e).</xsl:text>
</xsl:template>

<xsl:variable name="kg_security_distance_only_overlap">che sovrappongono strettamente.</xsl:variable>

<xsl:variable name="kg_security_distance_all_changes">tutti.</xsl:variable>

<!-- Display Options -->
<xsl:variable name="kg_display_options_title">Opzioni di Visualizzazione</xsl:variable>

<xsl:variable name="kg_display_line_endings">Visualizza i caratteri di fine di linea</xsl:variable>

<xsl:variable name="kg_display_line_numbers">Visualizza il numero di linea</xsl:variable>

<xsl:variable name="kg_display_statistics">Mostrare le statistiche di comparazione</xsl:variable>

<!-- Folders Comparison Options -->
<xsl:variable name="kg_folder_comparison_options_title">Opzioni di Comparazione</xsl:variable>

<xsl:variable name="kg_relative_path">Percorso relativo</xsl:variable>

<xsl:variable name="kg_presence">Presence</xsl:variable>

<xsl:variable name="kg_folder_depth">Profondità</xsl:variable>

<xsl:variable name="kg_folder_depth_one">Comparare solamento i file al livello più alto delle cartelle</xsl:variable>

<xsl:variable name="kg_folder_depth_all">Listare le cartelle ricorsivamente</xsl:variable>

<xsl:variable name="kg_folder_size_criteria">Criterio basato sulla dimensione</xsl:variable>

<xsl:variable name="kg_folder_diff_size_diff_files">Dimensioni di file differenti significa file differenti</xsl:variable>

<xsl:variable name="kg_folder_same_size_same_files">Dimensioni di file uguali significa file uguali</xsl:variable>

<xsl:variable name="kg_folder_date_criteria">Criterio basato sulla data</xsl:variable>

<xsl:variable name="kg_folder_diff_date_diff_files">Date di modifica di file differenti significa file differenti</xsl:variable>

<xsl:variable name="kg_folder_same_date_same_files">Date di modifica uguali significa file uguali</xsl:variable>

<xsl:variable name="kg_folder_same_date_and_size_same_files">Solamento se le dimensioni sono uguali</xsl:variable>

<xsl:variable name="kg_folder_fs_precision">Precisione del sistema di file</xsl:variable>

<xsl:variable name="kg_folder_compensate_fs_precision_loss">Compensare la perdita di precisione del sistema di file</xsl:variable>

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

<xsl:variable name="kg_folder_fs_exact">Data esatta</xsl:variable>

<xsl:variable name="kg_folder_fs_fixed">Differenza fissa</xsl:variable>

<xsl:variable name="kg_folder_fs_multiple">Differenza multipla</xsl:variable>

<xsl:variable name="kg_folder_filters_options_title">Filtri</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_title">Filtri per Nome</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_include">Pattern di inclusione</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_exclude">Pattern di esclusione</xsl:variable>

<xsl:variable name="kg_no_folder_filters_filename">No filtro per nome</xsl:variable>

<xsl:variable name="kg_folder_filters_status_title">Filtri per Status</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_missing">Nascondere file o cartelle mancanti</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_present">Nascondere file o cartelle presenti</xsl:variable>

<xsl:variable name="kg_folder_filters_in_source">nella gerarchia sinistra</xsl:variable>

<xsl:variable name="kg_folder_filters_in_target">nella gerarchia destra</xsl:variable>

<xsl:variable name="kg_folder_filters_in_ancestor">nella gerarchia antenato</xsl:variable>

<xsl:variable name="kg_folder_filters_in_result">nella gerarchia risultato</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_compared">Nascondere file</xsl:variable>

<xsl:variable name="kg_folder_filters_identical">uguali</xsl:variable>

<xsl:variable name="kg_folder_filters_different">differenti</xsl:variable>

<xsl:variable name="kg_folder_filters_conflicting">in conflitto</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_others">Altri elementi nascosto</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_system_hidden">File e cartelle nascosti del sistema</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_empty_identical_folders">Cartelle uguali senza contenuto</xsl:variable>

<xsl:variable name="kg_no_folder_filters_status">No filtro per Status</xsl:variable>

<xsl:variable name="kg_folder_filters_filedate_title">Filtri per Data</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_by_date_title">Usare le date per nascondere i file</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_if_everywhere">Nascondere un file solamente se esiste dappertutto</xsl:variable>

<xsl:template name="kg_folder_filters_exclude_files_by_date">
<xsl:param name="before" />
<xsl:param name="nb_days" />
<xsl:param name="date" />
<xsl:param name="use_date" />
	
	<xsl:choose>
	<xsl:when test="$before='yes'"><xsl:text>prima di </xsl:text></xsl:when>
	<xsl:otherwise><xsl:text>doppo di </xsl:text></xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
	<xsl:when test="$use_date='yes'">
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
	<xsl:when test="$nb = 1"><xsl:text>1 giorno</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> giorni</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:variable name="kg_no_folder_filters_filedate">No filtro per data</xsl:variable>

<xsl:variable name="kg_folder_display_options_title">Opzioni di Visualizzazione</xsl:variable>

<xsl:variable name="kg_folder_show_size">Mostrare la dimensione</xsl:variable>

<xsl:variable name="kg_folder_show_date">Mostrare la data</xsl:variable>

<xsl:variable name="kg_folder_show_mime">Mostrare il tipo MIME</xsl:variable>

<xsl:variable name="kg_folder_show_diff_count">Mostrare il numero di cambiamenti</xsl:variable>

<!-- Image Options -->
<xsl:variable name="kg_image_comparison_options_title">Opzioni di Comparazione di Immagine</xsl:variable>

<xsl:variable name="kg_image_exact_threshold">Soglio d'esattezza</xsl:variable>

<xsl:variable name="kg_image_difference_threshold">Soglio di differenza</xsl:variable>

<!-- Binary Options -->
<xsl:variable name="kg_binary_comparison_options_title">Opzioni di Comparazione di File Binarii</xsl:variable>

<xsl:variable name="kg_binary_max_distance">Massima distanza</xsl:variable>

<xsl:variable name="kg_binary_min_match">Corrispondenza minima</xsl:variable>

<!-- Comparison Statistics -->
<xsl:variable name="kg_statistics_title">Statistiche della comparazione</xsl:variable>

<xsl:variable name="kg_all_files_explanation">La somma "Tutti i file" può essere più grande della
	somma per tipo di file, infatti, quando si deduce che i file sono differenti con
	le regole di metadata (dimensione, data...) non si le apre e non si determina il tipo
	di file per accelerare il processo di comparazione.</xsl:variable>

<xsl:template name="kg_statistics_pair_info">
<xsl:param name="one" />
<xsl:param name="two" />
	
	<xsl:text>Entre </xsl:text><xsl:value-of select="$one" /><xsl:text> e </xsl:text><xsl:value-of select="$two" />
</xsl:template>

<xsl:variable name="kg_unchanged_items">Non modificato</xsl:variable>

<xsl:variable name="kg_changed_items">Modificato</xsl:variable>

<xsl:variable name="kg_inserted_items">Inserito</xsl:variable>

<xsl:variable name="kg_deleted_items">Rimosso</xsl:variable>

<xsl:variable name="kg_ignored_items">Ignorato</xsl:variable>

<xsl:variable name="kg_similar_items">Simile</xsl:variable>

<xsl:variable name="kg_all_changes">Tutti i cambiamenti</xsl:variable>

<xsl:template name="kg_merge_files_conflicts_description">
<xsl:param name="nb" />
	
	<xsl:text>Cambiamenti in </xsl:text>
	<b>
		<xsl:call-template name="kg_conflicts">
			<xsl:with-param name="nb" select="$nb" />
		</xsl:call-template>
	</b>
</xsl:template>

<xsl:template name="kg_merge_folders_with_conflicts">
<xsl:param name="nb" />
	
	<xsl:text>Non si può unire automaticament questa cartella. </xsl:text>
	<xsl:choose>
	<xsl:when test="$nb='1'">
		<xsl:text>C'è</xsl:text>
	</xsl:when>
	<xsl:otherwise>
		<xsl:text>Ci sono</xsl:text>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:text> </xsl:text>
	<b>
		<xsl:call-template name="kg_conflicts">
			<xsl:with-param name="nb" select="$nb" />
		</xsl:call-template>
	</b>
	<xsl:text> di file da risolvere manualmente.</xsl:text>
</xsl:template>

<xsl:template name="kg_conflicts">
<xsl:param name="nb" />
	
	<xsl:choose>
	<xsl:when test="$nb = 1"><xsl:text>1 conflitto</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> conflitti</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Comparison Details -->
<xsl:variable name="kg_details_title">Detagli della Comparazione</xsl:variable>

<xsl:variable name="kg_details_change_count_3">Questa colonna 'Cambiamenti' contiene il numero di cambiamenti trovati entre le gerarchie sinitra e destra.</xsl:variable>

<!-- Legend -->
<xsl:variable name="kg_legend_title">Legenda</xsl:variable>

<xsl:variable name="kg_unchanged_sample">Esempio di una linea non modificata</xsl:variable>

<xsl:variable name="kg_changed_sample">Esempio di una linea modificata</xsl:variable>

<xsl:variable name="kg_conflicting_sample">Esempio di una linea in conflitto</xsl:variable>

<xsl:variable name="kg_inserted_sample">Esempio di una linea inserita</xsl:variable>

<xsl:variable name="kg_deleted_sample">Esempio di una linea rimossa</xsl:variable>

<xsl:variable name="kg_ignored_sample">Esempio di una linea ignorata</xsl:variable>

<xsl:variable name="kg_unchanged_line">Linea non modificata</xsl:variable>

<xsl:variable name="kg_changed_line">Linea modificata</xsl:variable>

<xsl:variable name="kg_conflicting_line">Linea in conflitto</xsl:variable>

<xsl:variable name="kg_inserted_line">Linea inserita</xsl:variable>

<xsl:variable name="kg_deleted_line">Linea rimossa</xsl:variable>

<xsl:variable name="kg_ignored_line">Linea ignorata</xsl:variable>

<xsl:variable name="kg_unchanged_code">N</xsl:variable>

<xsl:variable name="kg_changed_code">M</xsl:variable>

<xsl:variable name="kg_inserted_code">A</xsl:variable>

<xsl:variable name="kg_deleted_code">R</xsl:variable>

<xsl:variable name="kg_ignored_code">I</xsl:variable>

<xsl:variable name="kg_inline_changed_text">Testo modificato</xsl:variable>

<xsl:variable name="kg_inline_inserted_text">Testo inserito</xsl:variable>

<xsl:variable name="kg_inline_deleted_text">Testo rimosso</xsl:variable>

<!-- Metadata -->
<xsl:variable name="kg_compared_files_titles">File comparati</xsl:variable>

<xsl:variable name="kg_compared_images_titles">Immagini comparate</xsl:variable>

<xsl:variable name="kg_compared_folders_titles">Cartelle comparate</xsl:variable>

<xsl:variable name="kg_2way_comparison">Comparazione 2-Way</xsl:variable>

<xsl:variable name="kg_3way_comparison">Comparazione 3-Way</xsl:variable>

<xsl:variable name="kg_file_name">Nome</xsl:variable>

<xsl:variable name="kg_last_modified">Data di modifica</xsl:variable>

<xsl:variable name="kg_size">Dimensione</xsl:variable>

<xsl:variable name="kg_encoding">Codifica</xsl:variable>

<xsl:variable name="kg_encoding_autodetected">autodetectato</xsl:variable>

<xsl:variable name="kg_encoding_default">predefinito</xsl:variable>

<xsl:variable name="kg_encoding_forced">forzato</xsl:variable>

<xsl:variable name="kg_result_location">Percorso risultato</xsl:variable>

<xsl:variable name="kg_no_result_location">No percorso risultato definito. Non si può determinare le azioni, la colonne che corresponde non sarà mostrata.</xsl:variable>

<xsl:variable name="kg_missing_file">file è mancante</xsl:variable>

<xsl:variable name="kg_missing_folder">cartella è mancante</xsl:variable>

<xsl:variable name="kg_syntax_colouring_language_used">Linguaggio di colorazione sintassi</xsl:variable>

<!-- Binary Files Comparison -->
<xsl:variable name="kg_binary_files_identical">File binarii sono uguali.</xsl:variable>

<xsl:variable name="kg_binary_files_different">File binarii sono differenti.</xsl:variable>

<!-- Images Files Comparison -->
<xsl:variable name="kg_images_files_identical">Immagini sono uguali.</xsl:variable>

<xsl:variable name="kg_images_files_different">Immagini sono differenti.</xsl:variable>

<!-- Text Files Comparison -->
<xsl:template name="kg_skipped_lines">
<xsl:param name="nb" />

	<xsl:choose>
	<xsl:when test="$nb = 1"><xsl:text>1 linea saltata</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> linee saltate</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Folder Comparison -->
<xsl:variable name="kg_merge_result">Risulato dell'unione</xsl:variable>

<xsl:variable name="kg_action">Azione/xsl:variable>

<xsl:template name="kg_changes">Cambiamenti</xsl:template>

<xsl:variable name="kg_changes_col_width">6</xsl:variable>

</xsl:stylesheet>
