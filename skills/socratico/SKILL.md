---
name: socratico
description: Analiza tareas con el método socrático antes de ejecutarlas. Genera 3 preguntas estructuradas (teórica, framework, aplicación) para entender profundamente el problema antes de implementar. Usa este skill cuando el usuario escriba "socrático:" seguido de una instrucción, o cuando pida analizar antes de implementar, reflexionar sobre un enfoque, pensar antes de codear, entender un problema antes de resolverlo, aplicar el método socrático, o quiera un análisis estructurado previo a la ejecución. También activa cuando el usuario diga "quiero entender primero", "analicemos esto", "antes de codear", o pida planificación reflexiva.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - AskUserQuestion
---

# Skill: Socrático

La reflexión antes de la acción produce mejores implementaciones. El método socrático estructura esa reflexión en 3 dimensiones — teoría, frameworks y aplicación — para que tanto tú como el usuario entiendan el problema en profundidad antes de escribir una sola línea de código. Esto evita retrabajos, descubre edge cases temprano, y alinea expectativas.

---

## Proceso

### PASO 1: Extraer la Instrucción

Antes de analizar, clarifica qué se pide. Extraer la instrucción primero evita que el análisis socrático se desvíe del objetivo real del usuario.

Formato de extracción:
```
**Instrucción extraída:** [descripción clara y concisa de lo que se pide]
```

---

### PASO 2: Generar 3 Preguntas Socráticas

Cada pregunta aporta una dimensión distinta de comprensión. Las 3 son necesarias porque juntas cubren el espectro completo: qué es bueno (teoría), cómo lograrlo (framework), y cómo aplicarlo aquí (contexto). Adapta la profundidad al tamaño de la tarea — tareas simples merecen un análisis más breve.

#### 1️⃣ TEÓRICA
> ¿Qué hace que [tipo de output solicitado] sea efectivo?

Responde con criterios concretos de calidad y efectividad. Lista 4-6 características que definen una buena implementación. Evita generalidades — cada criterio debe ser específico y verificable para esta tarea.

#### 2️⃣ FRAMEWORK
> ¿Qué principios, patrones o mejores prácticas aplican a este tipo de problema?

Identifica:
- Patrones de diseño relevantes
- Herramientas/librerías gold standard
- Principios de ingeniería que aplican
- Trade-offs comunes

#### 3️⃣ APLICACIÓN
> Aplica esos insights a [la tarea específica del usuario]

Genera un plan concreto que incorpore los insights de las preguntas anteriores. Incluye:
- Enfoque recomendado
- Código de ejemplo o pseudocódigo
- Consideraciones específicas del contexto

---

### PASO 3: Presentar el Análisis

Presenta las 3 secciones con respuestas concretas y específicas — no genéricas. No ejecutes la tarea todavía; el valor del método socrático está en que el usuario revise y valide el razonamiento antes de actuar.

Formato de presentación:

```markdown
## Socrático: [Título descriptivo]

**Instrucción extraída:** [lo que se pide]

---

### 1️⃣ TEÓRICA: ¿Qué hace que [X] sea efectivo?

- [criterio 1]
- [criterio 2]
- [criterio 3]
- [criterio 4]

---

### 2️⃣ FRAMEWORK: ¿Qué principios aplican?

- **[Patrón/Herramienta 1]**: [descripción breve]
- **[Patrón/Herramienta 2]**: [descripción breve]
- **[Principio]**: [por qué aplica]

---

### 3️⃣ APLICACIÓN: Plan concreto

[Código o pseudocódigo]

Con consideraciones:
- [consideración 1]
- [consideración 2]
```

---

### PASO 4: Confirmar Acción

Después de presentar el análisis, pregunta al usuario cómo quiere proceder usando AskUserQuestion con estas 3 opciones:
- **Ejecutar**: Proceder a implementar el plan
- **Copiar**: Entregar el plan en formato copiable
- **Refinar**: Ajustar el enfoque antes de implementar

---

## Manejo de Respuestas

### Si elige "Ejecutar"
Usa Read, Glob, Grep para explorar el código existente, y Write, Edit, Bash para implementar. Sigue los criterios de calidad de la pregunta TEÓRICA y aplica los patrones del FRAMEWORK.

### Si elige "Copiar"
Presenta el plan completo en un bloque de código markdown para fácil copia, incluyendo objetivo, enfoque, implementación y consideraciones.

### Si elige "Refinar"
Pregunta qué aspecto quiere ajustar:
- ¿El enfoque general?
- ¿Los criterios de calidad?
- ¿Los trade-offs?
- ¿El nivel de complejidad?

---

## Ejemplo

**Input:** `socrático: crea un script que sincronice archivos entre dos carpetas`

**Output esperado:**

**Instrucción extraída:** Crear script para sincronizar archivos entre dos carpetas.

**1️⃣ TEÓRICA** — Criterios como: detecta cambios incrementales, maneja conflictos, es idempotente, tiene dry-run, logging claro.

**2️⃣ FRAMEWORK** — Patrones como: rsync (gold standard para delta sync), Watchdog (cambios en tiempo real), Atomic operations (evitar corrupción).

**3️⃣ APLICACIÓN** — Plan concreto con rsync y opciones (`-avz --delete --dry-run`), explicando cada flag.

Luego pregunta: ¿Ejecutar, Copiar, o Refinar?
