<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:xlink="http://www.w3.org/1999/xlink">

<!-- *************************************************************************
strings used in report.xsl
************************************************************************** -->
<!-- Global constants -->
<xsl:variable name="kg_report_title">Informe de comparación</xsl:variable>

<xsl:variable name="kg_sub_report_title">Informe de comparación de archivo</xsl:variable>

<xsl:variable name="kg_statistics_report_title">Estadísticas de la comparación</xsl:variable>

<xsl:variable name="kg_statistics_global_title">Estadísticas generales</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_text_title">Estadísticas detalladas</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_image_title">Estadísticas detalladas</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_binary_title">Estadísticas detalladas</xsl:variable>

<xsl:variable name="kg_statistics_detailed_text_title">Estadísticas detalladas para los archivos de texto</xsl:variable>

<xsl:variable name="kg_statistics_detailed_image_title">Estadísticas detalladas para las imagenes</xsl:variable>

<xsl:variable name="kg_statistics_detailed_binary_title">Estadísticas detalladas para los archivos binarios</xsl:variable>

<xsl:template name="kg_report_info">
<xsl:param name="date" />

	<xsl:text>Generado por Ellié Computing Merge el </xsl:text>
	<xsl:value-of select="$date" />
	<xsl:text>.</xsl:text>
	<br/><xsl:text>&#169; 2005-2011 Ellié Computing </xsl:text>
	<a href="http://www.elliecomputing.com" target="_blank">http://www.elliecomputing.com</a>
	<xsl:text>. Todos los derechos reservados.</xsl:text>
</xsl:template>

<xsl:variable name="kg_yes">sí</xsl:variable>

<xsl:variable name="kg_no">no</xsl:variable>

<xsl:variable name="kg_description">Descripción</xsl:variable>

<xsl:variable name="kg_mega_bytes">Mb</xsl:variable>

<xsl:variable name="kg_kilo_bytes">Kb</xsl:variable>

<xsl:variable name="kg_bytes">Bytes</xsl:variable>

<xsl:variable name="kg_byteblocks">Bloques</xsl:variable>

<xsl:variable name="kg_left">Izquierda</xsl:variable>

<xsl:variable name="kg_ancestor">Antecesor</xsl:variable>

<xsl:variable name="kg_right">Derecha</xsl:variable>

<xsl:variable name="kg_files_and_folders">Archivos y Carpetas</xsl:variable>

<xsl:variable name="kg_files">Archivos</xsl:variable>

<xsl:variable name="kg_blocks">Bloques</xsl:variable>

<xsl:variable name="kg_lines">Líneas</xsl:variable>

<xsl:variable name="kg_image_dimensions">Dimensiones</xsl:variable>

<xsl:variable name="kg_pixels">Pixels</xsl:variable>

<xsl:variable name="kg_all_files">Todos los archivos</xsl:variable>

<xsl:variable name="kg_text_files">Archivos de texto</xsl:variable>

<xsl:variable name="kg_image_files">Imagenes</xsl:variable>

<xsl:variable name="kg_binary_files">Archivos binarios</xsl:variable>

<!-- Text Comparison Options -->
<xsl:variable name="kg_text_comparison_options_title">Opciones de comparación de texto</xsl:variable>

<xsl:variable name="kg_match_case">Considerar relevantes las diferencias de mayúsculas/minúsculas</xsl:variable>

<xsl:variable name="kg_match_line_endings">Considerar relevantes los caracteres en final de línea</xsl:variable>

<xsl:variable name="kg_match_whitespaces">Considerar relevantes los espacios en blanco</xsl:variable>

<xsl:variable name="kg_ws_start">Al inicio de línea</xsl:variable>

<xsl:variable name="kg_ws_middle">En medio de líneas</xsl:variable>

<xsl:variable name="kg_ws_end">A fines de línea</xsl:variable>

<xsl:variable name="kg_blank_lines_empty">Líneas en blanco </xsl:variable>

<xsl:variable name="kg_in_line_diff_algo">Activar el algoritmo de comparación</xsl:variable>

<xsl:variable name="kg_in_line_word">Al nivel de la palabra</xsl:variable>

<xsl:variable name="kg_in_line_char">Al nivel del caracter</xsl:variable>

<xsl:variable name="kg_ignore_line_changes_matching">Ignorar las lineas modificadas que concordan con las expreciones siguientes</xsl:variable>

<xsl:variable name="kg_surround_changes">Enmarcar las modificaciones</xsl:variable>

<xsl:template name="kg_security_distance">
<xsl:param name="line_nb" />

	<xsl:text>con une distancia de seguridad de </xsl:text><xsl:value-of select="$line_nb" /><xsl:text> línea(s).</xsl:text>
</xsl:template>

<xsl:variable name="kg_security_distance_only_overlap">quienes entrecruzan.</xsl:variable>

<xsl:variable name="kg_security_distance_all_changes">todas.</xsl:variable>

<!-- Display Options -->
<xsl:variable name="kg_display_options_title">Opciones de Visualización</xsl:variable>

<xsl:variable name="kg_display_line_endings">Mostrar los caracteres de fin de línea</xsl:variable>

<xsl:variable name="kg_display_line_numbers">Mostrar los números de línea</xsl:variable>

<xsl:variable name="kg_display_statistics">Mostrar el resumen de comparación</xsl:variable>

<!-- Folders Comparison Options -->
<xsl:variable name="kg_folder_comparison_options_title">Opciones de comparación</xsl:variable>

<xsl:variable name="kg_relative_path">Camino relativo</xsl:variable>

<xsl:variable name="kg_presence">Presence</xsl:variable>

<xsl:variable name="kg_folder_depth">Profundidad</xsl:variable>

<xsl:variable name="kg_folder_depth_one">Se comparan sólo los archivos en el nivel superior de las carpetas</xsl:variable>

<xsl:variable name="kg_folder_depth_all">Se comparan todos los archivos recursivamente</xsl:variable>

<xsl:variable name="kg_folder_size_criteria">Criterios relativos al tamaño</xsl:variable>

<xsl:variable name="kg_folder_diff_size_diff_files">Diferentes tamaños implican archivos diferentes</xsl:variable>

<xsl:variable name="kg_folder_same_size_same_files">Tamaños iguales implican archivos iguales</xsl:variable>

<xsl:variable name="kg_folder_date_criteria">Criterios relativos a la fecha</xsl:variable>

<xsl:variable name="kg_folder_diff_date_diff_files">Fechas diferentes implican archivos diferentes</xsl:variable>

<xsl:variable name="kg_folder_same_date_same_files">Fechas iguales implican archivos iguales</xsl:variable>

<xsl:variable name="kg_folder_same_date_and_size_same_files">Sólo con tamaños iguales</xsl:variable>

<xsl:variable name="kg_folder_fs_precision">Precisión del sistema de archivos</xsl:variable>

<xsl:variable name="kg_folder_compensate_fs_precision_loss">Compensar la pérdida de precisión del sistema de archivos</xsl:variable>

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
		<xsl:text> minutos)</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:variable name="kg_folder_fs_exact">Fechas exactas</xsl:variable>

<xsl:variable name="kg_folder_fs_fixed">Diferencia fija</xsl:variable>

<xsl:variable name="kg_folder_fs_multiple">Diferencia múltiple</xsl:variable>

<xsl:variable name="kg_folder_filters_options_title">Filtros</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_title">Filtros por nombre</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_include">Filtros de inclusión</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_exclude">Filtros de exclusión</xsl:variable>

<xsl:variable name="kg_no_folder_filters_filename">Ningún filtro por nombre</xsl:variable>

<xsl:variable name="kg_folder_filters_status_title">Filtros por estado</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_missing">Ocultar archivos y carpetas ausentes</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_present">Ocultar archivos y carpetas presentes</xsl:variable>

<xsl:variable name="kg_folder_filters_in_source">en la jerarquía de izquierda</xsl:variable>

<xsl:variable name="kg_folder_filters_in_target">en la jerarquía de derecha</xsl:variable>

<xsl:variable name="kg_folder_filters_in_ancestor">en la jerarquía del antecesor</xsl:variable>

<xsl:variable name="kg_folder_filters_in_result">en la jerarquía resultado</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_compared">Ocultar archivos</xsl:variable>

<xsl:variable name="kg_folder_filters_identical">sin cambios</xsl:variable>

<xsl:variable name="kg_folder_filters_different">diferentes</xsl:variable>

<xsl:variable name="kg_folder_filters_conflicting">en conflicto</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_others">Otros elementos ocultados</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_system_hidden">Archivos y carpetas ocultos en el sistema</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_empty_identical_folders">Carpetas iguales sin contenido visible</xsl:variable>

<xsl:variable name="kg_no_folder_filters_status">Ningún filtro por estado</xsl:variable>

<xsl:variable name="kg_folder_filters_filedate_title">Filtros por fecha</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_by_date_title">Utilizar las fechas para ocultar los archivos modificados</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_if_everywhere">Ocultar el archivo sólo si existe en todas partes</xsl:variable>

<xsl:template name="kg_folder_filters_exclude_files_by_date">
<xsl:param name="before" />
<xsl:param name="nb_days" />
<xsl:param name="date" />
<xsl:param name="use_date" />
	
	<xsl:choose>
	<xsl:when test="$before='yes'"><xsl:text>antes del </xsl:text></xsl:when>
	<xsl:otherwise><xsl:text>después del </xsl:text></xsl:otherwise>
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
	<xsl:when test="$nb = 1"><xsl:text>1 día</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> días</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:variable name="kg_no_folder_filters_filedate">Ningún filtro por fecha</xsl:variable>

<xsl:variable name="kg_folder_display_options_title">Opciones de Visualización</xsl:variable>

<xsl:variable name="kg_folder_show_size">Mostrar el tamaño</xsl:variable>

<xsl:variable name="kg_folder_show_date">Mostrar la fecha</xsl:variable>

<xsl:variable name="kg_folder_show_mime">Mostrar el tipo MIME</xsl:variable>

<xsl:variable name="kg_folder_show_diff_count">Mostrar la columna de cambios</xsl:variable>

<!-- Image Options -->
<xsl:variable name="kg_image_comparison_options_title">Opciones de comparación de imagenes</xsl:variable>

<xsl:variable name="kg_image_exact_threshold">Umbral de exactitud</xsl:variable>

<xsl:variable name="kg_image_difference_threshold">Umbral de diferencia</xsl:variable>

<!-- Binary Options -->
<xsl:variable name="kg_binary_comparison_options_title">Opciones de comparación de archivos binarios</xsl:variable>

<xsl:variable name="kg_binary_max_distance">Máxima distancia</xsl:variable>

<xsl:variable name="kg_binary_min_match">Coincidencia minimal</xsl:variable>

<!-- Comparison Statistics -->
<xsl:variable name="kg_statistics_title">Resumen de la comparación</xsl:variable>

<xsl:variable name="kg_all_files_explanation">La suma "Todos los archivos" puede ser superior
	a la suma de los números de los archivos por tipo, en efecto, no se abre los archivos
	definidos como diferentos por reglas con metadatos (tamaño, fecha...), y no se determina
	su tipo para acelerar la comparación.</xsl:variable>

<xsl:template name="kg_statistics_pair_info">
<xsl:param name="one" />
<xsl:param name="two" />
	
	<xsl:text>Entre </xsl:text><xsl:value-of select="$one" /><xsl:text> y </xsl:text><xsl:value-of select="$two" />
</xsl:template>

<xsl:variable name="kg_unchanged_items">Sin cambios</xsl:variable>

<xsl:variable name="kg_changed_items">Modificados</xsl:variable>

<xsl:variable name="kg_inserted_items">Agregados</xsl:variable>

<xsl:variable name="kg_deleted_items">Quitados</xsl:variable>

<xsl:variable name="kg_ignored_items">Ignorados</xsl:variable>

<xsl:variable name="kg_similar_items">Similar</xsl:variable>

<xsl:variable name="kg_all_changes">Todas las differencias</xsl:variable>

<xsl:template name="kg_merge_files_conflicts_description">
<xsl:param name="nb" />
	
	<xsl:text>Differencias en </xsl:text>
	<b>
		<xsl:call-template name="kg_conflicts">
			<xsl:with-param name="nb" select="$nb" />
		</xsl:call-template>
	</b>
</xsl:template>

<xsl:template name="kg_merge_folders_with_conflicts">
<xsl:param name="nb" />
	
	<xsl:text>No es posible combinar estas carpetas automaticamente. Genera </xsl:text>
	<b>
		<xsl:call-template name="kg_conflicts">
			<xsl:with-param name="nb" select="$nb" />
		</xsl:call-template>
	</b>
	<xsl:text> de archivos que resolver manualmente.</xsl:text>
</xsl:template>

<xsl:template name="kg_conflicts">
<xsl:param name="nb" />
	
	<xsl:choose>
	<xsl:when test="$nb = 1"><xsl:text>1 conflicto</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> conflictos</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Comparison Details -->
<xsl:variable name="kg_details_title">Detalle de comparación</xsl:variable>

<xsl:variable name="kg_details_change_count_3">Esta columna 'Cambios' contiene el número de differencias encontradas entre las carpetas de izquierda y derecha.</xsl:variable>

<!-- Legend -->
<xsl:variable name="kg_legend_title">Leyenda</xsl:variable>

<xsl:variable name="kg_unchanged_sample">Ejemplo de una línea sin cambios</xsl:variable>

<xsl:variable name="kg_changed_sample">Ejemplo de una línea modificada</xsl:variable>

<xsl:variable name="kg_conflicting_sample">Ejemplo de una línea en conflicto</xsl:variable>

<xsl:variable name="kg_inserted_sample">Ejemplo de una línea agregada</xsl:variable>

<xsl:variable name="kg_deleted_sample">Ejemplo de una línea quitada</xsl:variable>

<xsl:variable name="kg_ignored_sample">Example de una línea ignorada</xsl:variable>

<xsl:variable name="kg_unchanged_line">Línea sin cambios</xsl:variable>

<xsl:variable name="kg_changed_line">Línea modificada</xsl:variable>

<xsl:variable name="kg_conflicting_line">Línea en conflicto</xsl:variable>

<xsl:variable name="kg_inserted_line">Línea agregada</xsl:variable>

<xsl:variable name="kg_deleted_line">Línea quitada</xsl:variable>

<xsl:variable name="kg_ignored_line">Línea ignorada</xsl:variable>

<xsl:variable name="kg_unchanged_code">S</xsl:variable>

<xsl:variable name="kg_changed_code">M</xsl:variable>

<xsl:variable name="kg_inserted_code">A</xsl:variable>

<xsl:variable name="kg_deleted_code">Q</xsl:variable>

<xsl:variable name="kg_ignored_code">I</xsl:variable>

<xsl:variable name="kg_inline_changed_text">Texto modificado</xsl:variable>

<xsl:variable name="kg_inline_inserted_text">Texto agregado</xsl:variable>

<xsl:variable name="kg_inline_deleted_text">Texto quitado</xsl:variable>

<!-- Metadata -->
<xsl:variable name="kg_compared_files_titles">Archivos comparados</xsl:variable>

<xsl:variable name="kg_compared_images_titles">Imagenes comparadas</xsl:variable>

<xsl:variable name="kg_compared_folders_titles">Carpetas comparadas</xsl:variable>

<xsl:variable name="kg_2way_comparison">Comparación bilateral</xsl:variable>

<xsl:variable name="kg_3way_comparison">Comparación trilateral</xsl:variable>

<xsl:variable name="kg_file_name">Archivo</xsl:variable>

<xsl:variable name="kg_last_modified">Última modificación</xsl:variable>

<xsl:variable name="kg_size">Tamaño</xsl:variable>

<xsl:variable name="kg_encoding">Codificación</xsl:variable>

<xsl:variable name="kg_encoding_autodetected">auto-detectada</xsl:variable>

<xsl:variable name="kg_encoding_default">defecto</xsl:variable>

<xsl:variable name="kg_encoding_forced">forzada</xsl:variable>

<xsl:variable name="kg_result_location">Ubicación del resultado</xsl:variable>

<xsl:variable name="kg_no_result_location">Ninguna ubicación de resultado definido. No es possible determinar las acciones, la columna correspondiente no se visualizará.</xsl:variable>

<xsl:variable name="kg_missing_file">archivo faltante</xsl:variable>

<xsl:variable name="kg_missing_folder">carpeta faltante</xsl:variable>

<xsl:variable name="kg_syntax_colouring_language_used">Coloración sintáctica</xsl:variable>

<!-- Binary Files Comparison -->
<xsl:variable name="kg_binary_files_identical">Los archivos binarios son iguales.</xsl:variable>

<xsl:variable name="kg_binary_files_different">Los archivos binarios son diferentes.</xsl:variable>

<!-- Images Files Comparison -->
<xsl:variable name="kg_images_files_identical">Las imagenes son iguales.</xsl:variable>

<xsl:variable name="kg_images_files_different">Las imagenes son diferentes.</xsl:variable>

<!-- Text Files Comparison -->
<xsl:template name="kg_skipped_lines">
<xsl:param name="nb" />

	<xsl:choose>
	<xsl:when test="$nb = 1"><xsl:text>1 línea omitida</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> líneas omitidas</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Folder Comparison -->
<xsl:variable name="kg_merge_result">Resultado de la fusión</xsl:variable>

<xsl:variable name="kg_action">Acción</xsl:variable>

<xsl:template name="kg_changes">Cambios</xsl:template>

<xsl:variable name="kg_changes_col_width">6</xsl:variable>

</xsl:stylesheet>
