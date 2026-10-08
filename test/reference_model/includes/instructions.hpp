#pragma once
#include <instruction_types.hpp>

class ADD : public rtype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SUB : public rtype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SLL : public rtype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SLT : public rtype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SLTU : public rtype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class XOR : public rtype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SRL : public rtype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SRA : public rtype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class OR : public rtype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class AND : public rtype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

//--------------------------------------------------------------------

class ADDI : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SLLI : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SLTI : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SLTUI : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class XORI : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SRLI : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SRAI : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class ORI : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class ANDI : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class JALR : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class LB : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class LH : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class LW : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class LBU : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class LHU : public itype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

//--------------------------------------------------------------------

class SB : public stype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SH : public stype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class SW : public stype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

//--------------------------------------------------------------------

class BEQ : public btype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class BNE : public btype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class BLT : public btype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class BGE : public btype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class BLTU : public btype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class BGEU : public btype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

//--------------------------------------------------------------------

class JAL : public jtype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

//--------------------------------------------------------------------

class AUIPC : public utype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};

class LUI : public utype{
  public: 
    void execute(ram& program_ram, cpu_state& cpu_state);
};
