{{- $critical := 0 }}
{{- $high := 0 }}

{{- range . }}
  {{- range .Vulnerabilities }}
    {{- if  eq .Severity "CRITICAL" }}
      {{- $critical = add $critical 1 }}
    {{- end }}
    {{- if  eq .Severity "HIGH" }}
      {{- $high = add $high 1 }}
    {{- end }}
  {{- end }}
{{- end }}

| VulnerabilityID | Severity |
| - | - |
{{- range .}}
  {{- range .Vulnerabilities }}
  | {{ .VulnerabilityID }} |  {{ .Severity }} |
  {{- end }}
{{- end }}
| Total Critical | {{ $critical }} | 
| Total High | {{ $high }} |

