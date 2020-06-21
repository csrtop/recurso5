# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
 ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
inflect.irregular 'club', 'clubes'
inflect.irregular 'departamento', 'departamentos'
inflect.irregular 'certificado', 'certificados'
inflect.irregular 'permiso', 'permisos'
inflect.irregular 'genero', 'generos'
inflect.irregular 'puesto', 'puestos'
inflect.irregular 'examen', 'examenes'

#   inflect.uncountable %w( fish sheep )
 end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
