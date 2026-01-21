import tkinter as tk
from tkinter import ttk
from tkinter import messagebox

class BiocharKidsApp:
    def __init__(self, root):
        self.root = root
        self.root.title("🌱 The Magic of Biochar 🌱")
        self.root.geometry("500x650")
        
        # 1. FUN COLORS & STYLES
        self.colors = {
            "bg": "#E0F7FA",       # Light Blue
            "header": "#00695C",   # Dark Teal
            "button": "#FF7043",   # Orange
            "text": "#004D40"      # Dark Green
        }
        self.root.configure(bg=self.colors["bg"])

        # Style configuration for nicer buttons
        style = ttk.Style()
        style.theme_use('clam')
        style.configure('TNotebook', background=self.colors["bg"])
        style.configure('TNotebook.Tab', font=('Arial', 12, 'bold'), padding=[10, 5])
        style.configure('TButton', font=('Arial', 12, 'bold'), background=self.colors["button"], foreground="white")
        style.configure('TLabel', background=self.colors["bg"], font=('Arial', 11))
        style.configure('Header.TLabel', font=('Comic Sans MS', 18, 'bold'), foreground=self.colors["header"])

        # Main Title
        title = ttk.Label(root, text="🌳 Biochar Adventure 🌳", style="Header.TLabel")
        title.pack(pady=15)

        # Tabs
        self.notebook = ttk.Notebook(root)
        self.notebook.pack(expand=True, fill='both', padx=15, pady=10)

        # Create the pages
        self.create_story_tab()
        self.create_lab_tab()
        self.create_quiz_tab()

    def create_story_tab(self):
        frame = ttk.Frame(self.notebook)
        self.notebook.add(frame, text='📖 Story')
        
        # We use a Canvas to make it scrollable if needed, but a Text widget is easier for colors
        text_area = tk.Text(frame, wrap='word', font=("Arial", 12), bg="white", padx=15, pady=15, bd=0)
        text_area.pack(expand=True, fill='both')

        # Kid-friendly content with emojis
        story = """
👋 HI EXPLORER! 

Do you know plants have superpowers? 🌱
When plants die, we can turn them into something magical called BIOCHAR.

WHAT IS BIOMASS? 🍂
It's just nature's leftovers!
• Old wood 🪵
• Corn stalks 🌽
• Cow poop (Eww! but useful!) 💩

HOW DO WE COOK IT? 🔥
We bake the plants in a special oven called "Pyrolysis".
But here is the secret: NO AIR! 🚫💨
If we used air, it would burn to ash. Without air, it turns into a black sponge called BIOCHAR.

WHY IS BIOCHAR A HERO? 🦸
• It acts like a sponge for water 🧽 (Plants don't get thirsty!)
• It captures bad gas (CO2) from the air so the Earth stays cool 🌍.
• It stays in the ground for 100s of years!
        """
        
        text_area.insert('1.0', story)
        
        # Make the text colorful
        text_area.tag_configure("highlight", foreground="#D84315", font=("Arial", 14, "bold"))
        text_area.config(state='disabled') # Read only

    def create_lab_tab(self):
        frame = ttk.Frame(self.notebook)
        frame.configure(style='TFrame') # Use default style to pick up background
        # Note: ttk.Frame background is tricky, let's use a Label as background container
        container = tk.Frame(frame, bg=self.colors["bg"])
        container.pack(expand=True, fill='both', padx=20, pady=20)
        
        self.notebook.add(frame, text='⚗️ The Lab')

        lbl = tk.Label(container, text="🧑‍🔬 Biochar Maker 3000", font=("Comic Sans MS", 16, "bold"), bg=self.colors["bg"], fg=self.colors["header"])
        lbl.pack(pady=10)

        tk.Label(container, text="How much waste do you have? (kg)", bg=self.colors["bg"], font=("Arial", 12)).pack(anchor='w')
        
        self.entry_biomass = ttk.Entry(container, font=('Arial', 14))
        self.entry_biomass.pack(fill='x', pady=5)

        tk.Label(container, text="What is it made of?", bg=self.colors["bg"], font=("Arial", 12)).pack(anchor='w', pady=(15,0))
        
        self.combo_material = ttk.Combobox(container, values=[
            "🪵 Wood Chips", 
            "🌽 Corn Stalks", 
            "💩 Animal Manure", 
            "🌿 Garden Weeds"
        ], font=('Arial', 12), state="readonly")
        self.combo_material.current(0)
        self.combo_material.pack(fill='x', pady=5)

        # Big Action Button
        btn = tk.Button(container, text="🔥 COOK IT! 🔥", bg="#FF5722", fg="white", font=("Arial", 14, "bold"), command=self.cook_biochar)
        btn.pack(pady=25, fill='x')

        self.result_lbl = tk.Label(container, text="Waiting for ingredients...", bg="#FFF3E0", fg="#BF360C", font=("Arial", 12, "bold"), padx=10, pady=10, relief="solid")
        self.result_lbl.pack(pady=10, fill='x')

    def create_quiz_tab(self):
        frame = ttk.Frame(self.notebook)
        self.notebook.add(frame, text='❓ Quiz')
        
        container = tk.Frame(frame, bg=self.colors["bg"])
        container.pack(expand=True, fill='both', padx=20, pady=20)

        tk.Label(container, text="Test your Brain! 🧠", font=("Comic Sans MS", 16, "bold"), bg=self.colors["bg"]).pack(pady=10)

        # Question 1
        self.q1_lbl = tk.Label(container, text="1. What does Biochar act like in the soil?", bg=self.colors["bg"], font=("Arial", 11, "bold"))
        self.q1_lbl.pack(anchor='w', pady=5)
        
        self.q1_var = tk.StringVar(value="None")
        tk.Radiobutton(container, text="A Rock 🪨", variable=self.q1_var, value="wrong", bg=self.colors["bg"]).pack(anchor='w')
        tk.Radiobutton(container, text="A Sponge 🧽", variable=self.q1_var, value="correct", bg=self.colors["bg"]).pack(anchor='w')

        # Question 2
        tk.Label(container, text="2. Does making Biochar need air?", bg=self.colors["bg"], font=("Arial", 11, "bold")).pack(anchor='w', pady=(15, 5))
        
        self.q2_var = tk.StringVar(value="None")
        tk.Radiobutton(container, text="Yes, lots of air! 💨", variable=self.q2_var, value="wrong", bg=self.colors["bg"]).pack(anchor='w')
        tk.Radiobutton(container, text="No, zero air! 🚫", variable=self.q2_var, value="correct", bg=self.colors["bg"]).pack(anchor='w')

        # Check Button
        btn = tk.Button(container, text="Check My Answers", bg="#4CAF50", fg="white", font=("Arial", 12, "bold"), command=self.check_quiz)
        btn.pack(pady=30)

    def cook_biochar(self):
        try:
            biomass = float(self.entry_biomass.get())
            material = self.combo_material.get()
            
            # Simple math for kids (approximate)
            if "Wood" in material: rate = 0.30
            elif "Corn" in material: rate = 0.25
            elif "Manure" in material: rate = 0.20
            else: rate = 0.25

            biochar = biomass * rate
            co2_saved = biochar * 3

            msg = f"✨ AMAZING! ✨\n\nYou made {biochar:.1f} kg of Biochar!\nYou stopped {co2_saved:.1f} kg of CO2!\n\nThe Earth says Thank You! 🌍💙"
            self.result_lbl.config(text=msg, bg="#C8E6C9", fg="#2E7D32")
            
        except ValueError:
            messagebox.showerror("Oops!", "Please type a number in the box! 🔢")

    def check_quiz(self):
        score = 0
        if self.q1_var.get() == "correct": score += 1
        if self.q2_var.get() == "correct": score += 1
        
        if score == 2:
            messagebox.showinfo("Result", "🌟 2/2 CORRECT! You are a Biochar Master! 🌟")
        elif score == 1:
            messagebox.showinfo("Result", "👍 1/2 Correct. Good job!")
        else:
            messagebox.showinfo("Result", "🙃 0/2. Read the Story tab and try again!")

if __name__ == "__main__":
    root = tk.Tk()
    app = BiocharKidsApp(root)
    root.mainloop()
