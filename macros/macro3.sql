{% macro convert_time_unit(source_unit, target_unit, column) %}
    
    {# Define conversion factors to milliseconds #}
    {% set unit_to_ms = {
        'ms': 1,
        's': 1000,
        'm': 60000,
        'h': 3600000,
        'd': 86400000
    } %}
    
    {# Validate input units #}
    {% if source_unit not in unit_to_ms or target_unit not in unit_to_ms %}
        {{ exceptions.raise_compiler_error("Invalid unit. Supported units are: ms, s, m, h, d") }}
    {% endif %}
    
    {# Convert to target unit #}
    {% if source_unit == target_unit %}
        {{ column }}
    {% else %}
        {# First convert to ms, then to target unit #}
        ({{ column }} * {{ unit_to_ms[source_unit] }} / {{ unit_to_ms[target_unit] }})
    {% endif %}
    
{% endmacro %}