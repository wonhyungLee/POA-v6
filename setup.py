import os
import shutil
import sys
import subprocess


def post_install():
    """Post installation script for POA v6"""
    print("POA v6 Setup - Starting post-installation configuration...")
    
    # Get the current directory
    base_dir = os.path.dirname(os.path.abspath(__file__))
    
    # 1. Create necessary directories
    directories = [
        os.path.join(base_dir, "logs"),
        os.path.join(base_dir, "data"),
        os.path.join(base_dir, "temp"),
    ]
    
    for directory in directories:
        if not os.path.exists(directory):
            os.makedirs(directory)
            print(f"Created directory: {directory}")
    
    # 2. Copy .env.example to .env if .env doesn't exist
    env_example = os.path.join(base_dir, ".env.example")
    env_file = os.path.join(base_dir, ".env")
    
    if not os.path.exists(env_file) and os.path.exists(env_example):
        shutil.copy(env_example, env_file)
        print(f"Created .env file from .env.example")
        print("Please edit .env file and add your API keys!")
    elif os.path.exists(env_file):
        print(".env file already exists")
    
    # 3. Create store.db if it doesn't exist
    store_db = os.path.join(base_dir, "store.db")
    if not os.path.exists(store_db):
        # Create an empty SQLite database file
        open(store_db, 'a').close()
        print(f"Created store.db file")
    
    # 4. Set up log configuration
    log_config = """
# POA v6 Logging Configuration
log_level = "INFO"
log_file = "logs/poa.log"
log_rotation = "1 day"
log_retention = "7 days"
"""
    
    log_config_file = os.path.join(base_dir, "log_config.py")
    if not os.path.exists(log_config_file):
        with open(log_config_file, 'w') as f:
            f.write(log_config)
        print(f"Created log configuration file")
    
    print("\nPOA v6 Setup Complete!")
    print("=" * 50)
    print("Next steps:")
    print("1. Edit the .env file and add your API keys")
    print("2. Run 'python run.py' to start the application")
    print("=" * 50)


if __name__ == "__main__":
    post_install()
