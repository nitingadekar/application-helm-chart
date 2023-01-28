{{/*
Expand the name of the chart.
*/}}
{{- define "portal-name.name" -}}
{{- default .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "portal-name.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Release.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "portal-name.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "portal-name.labels" -}}
helm.sh/chart: {{ include "portal-name.chart" . }}
{{ include "portal-name.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "portal-name.selectorLabels" -}}
app.kubernetes.io/name: {{ include "portal-name.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app: {{ .Release.Name }}
role: {{ .Release.Name }}
{{- end }}


{{- define "portal-name.webSelectorLabels" -}}
{{- if .Values.web.enabled -}}
app.kubernetes.io/name: {{ include "portal-name.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}-web
app: {{ .Release.Name }}-web
role: web
{{- end }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "portal-name.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "portal-name.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
