package main

import (
	"os"

	"gopkg.in/yaml.v3"
)

type Config struct {
	Personal   Personal     `yaml:"personal"`
	Projects   []Project    `yaml:"projects"`
	Experience []Experience `yaml:"experience"`
	Education  []Education  `yaml:"education"`
	Skills     []SkillGroup `yaml:"skills"`
}

type Personal struct {
	Name     string `yaml:"name"`
	Title    string `yaml:"title"`
	Tagline  string `yaml:"tagline"`
	Email    string `yaml:"email"`
	LinkedIn string `yaml:"linkedin"`
	GitHub   string `yaml:"github"`
	Site     string `yaml:"site"`
	Phone    string `yaml:"phone"`
	Location string `yaml:"location"`
}

type Project struct {
	Name   string   `yaml:"name"`
	Skills string   `yaml:"skills"`
	Date   string   `yaml:"date"`
	Points []string `yaml:"points"`
}

type Experience struct {
	Role     string   `yaml:"role"`
	Name     string   `yaml:"name"`
	Location string   `yaml:"location"`
	Date     string   `yaml:"date"`
	Points   []string `yaml:"points"`
}

type Education struct {
	Name     string `yaml:"name"`
	Degree   string `yaml:"degree"`
	Location string `yaml:"location"`
	Date     string `yaml:"date"`
}

type SkillGroup struct {
	Category string `yaml:"category"`
	Skills   string `yaml:"skills"`
}

func LoadConfig(path string) (*Config, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}

	var config Config
	if err := yaml.Unmarshal(data, &config); err != nil {
		return nil, err
	}

	return &config, nil
}
