# Socratico Skill para Claude Code

Skill para analisis socratico antes de implementar tareas. Genera 3 preguntas (teorica, framework, aplicacion) para entender profundamente el problema antes de codear.

---

## Caracteristicas

- **Metodo socratico estructurado** - 3 preguntas que profundizan el entendimiento
- **Pregunta teorica** - Que hace que este tipo de solucion sea efectiva?
- **Pregunta de framework** - Que principios, patrones o mejores practicas aplican?
- **Pregunta de aplicacion** - Plan concreto aplicando los insights anteriores
- **Flujo interactivo** - Presenta analisis y espera confirmacion antes de ejecutar

---

## Uso

Activa el skill con el prefijo `socratico:` seguido de la tarea:

```
socratico: implementa autenticacion con JWT
socratico: refactoriza este componente para usar hooks
socratico: crea un script que sincronice archivos
```

El skill generara un analisis estructurado y preguntara como proceder:
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

## Instalacion

### Claude Code (Plugin)

Instala desde el marketplace sancrisoft-plugins:

```bash
claude plugin install socratico --marketplace sancrisoft-plugins
```

### Skills CLI (alternativa)

Si no usas Claude Code, puedes instalar con `npx skills`:

```bash
npx skills add https://github.com/sancrisoft/socratico-skill.git
```

---

## Desinstalacion

```bash
claude plugin uninstall socratico
```

---

## Verificacion

Despues de instalar, reinicia Claude Code y prueba:

```
socratico: crea una funcion que valide emails
```

Deberias ver el analisis socratico con las 3 preguntas estructuradas.

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
