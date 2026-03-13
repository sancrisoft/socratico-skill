# Socratico Skill para Claude Code

Skill para análisis socrático antes de implementar tareas. Genera 3 preguntas (teórica, framework, aplicación) para entender profundamente el problema antes de codear.

---

## Características

- **Método socrático estructurado** - 3 preguntas que profundizan el entendimiento
- **Pregunta teórica** - ¿Qué hace que este tipo de solución sea efectiva?
- **Pregunta de framework** - ¿Qué principios, patrones o mejores prácticas aplican?
- **Pregunta de aplicación** - Plan concreto aplicando los insights anteriores
- **Flujo interactivo** - Presenta análisis y espera confirmación antes de ejecutar

---

## Uso

Activa el skill con el prefijo `socrático:` seguido de la tarea:

```
socrático: implementa autenticación con JWT
socrático: refactoriza este componente para usar hooks
socrático: crea un script que sincronice archivos
```

El skill generará un análisis estructurado y preguntará cómo proceder:

- **Ejecutar** - Implementa el plan presentado
- **Copiar** - Te da el plan en formato copiable
- **Refinar** - Ajusta el enfoque antes de implementar

---

## Prerequisitos

### Claude Code CLI (Requerido)

```bash
npm install -g @anthropic-ai/claude-code
claude --version
```

---

## Instalación

### Claude Code (Plugin)

Dentro de Claude Code, ejecuta:

```
/plugin install socratico@sancrisoft/plugins
```

### Skills CLI (alternativa)

Si no usas Claude Code, puedes instalar con `npx skills`:

```bash
npx skills add https://github.com/sancrisoft/socratico-skill.git
```

---

## Desinstalación

```bash
claude plugin uninstall socratico
```

---

## Verificación

Después de instalar, reinicia Claude Code y prueba:

```
socrático: crea una función que valide emails
```

Deberías ver el análisis socrático con las 3 preguntas estructuradas.

---

## Estructura

```
socratico-skill/
├── .claude-plugin/
│   └── plugin.json
├── README.md
└── skills/
    └── socratico/
        └── SKILL.md
```

---

## Licencia

MIT
